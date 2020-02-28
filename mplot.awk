# mplot - Monthly Frequency Plot
#
# Example of usage:
#  SPECIES="Tachina fera"; cat Box-*.csv | awk -f mplot.awk -v species="$SPECIES" > "$SPECIES.svg"; firefox --new-window "$SPECIES.svg"
#  SPECIES=Tachina_fera; cat Box-*.csv | awk -f mplot.awk -v species="$SPECIES" > "$SPECIES.svg"; firefox --new-window "$SPECIES.svg"


function svg_tag(x, y, w, h, class) {
  printf("<svg viewBox=\"%s %s %s %s\" stroke=\"black\" stroke-opacity=\"1.0\" fill=\"white\" fill-opacity=\"0.0\" class=\"%s\" xmlns=\"http://www.w3.org/2000/svg\">\n", x-10, y-10, w+20, h+20, class)
  # We add 10px margin to ensure that the title and labels are shown no matter which font is used.
}

function svg_end_tag() {
  printf "</svg>\n"
}

function text_tag(str, x, y, font_size, class) {
  printf("<text x=\"%s\" y=\"%s\" font-size=\"%s\" class=\"%s\" fill=\"black\" fill-opacity=\"1.0\">%s</text>\n", x, y, font_size, class, str)
  # We add 2px left-padding to the x values of text
}

function rect_tag(x, y, w, h, class) {
  printf("<rect x=\"%s\" y=\"%s\" width=\"%s\" height=\"%s\" class=\"%s\" fill=\"white\" fill-opacity=\"0.0\" />\n", x, y, w, h, class)
}


BEGIN {  # Before any lines are read...

  # Handle quoted fields properly
  FPAT= "([^,]*)|(\"[^\"]*\")"

  # Convert underscores in the species name to spaces
  gsub(/_/, " ", species)
  
  # Set sizes of title, plot and label areas in pixels
  th = 15     # title height
  lh = 15     # label height
  lw = 25     # label width
  ph = 200    # plot height
  pw = 12*lw  # plot width

  # Initialize month labels
  split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", labels)

  # Initialize count and monthly frequencies
  count = 0
  for (m= 1; m <= 12; m++)
    f[m]= 0

}


$1 != "Box" && $7 == species {  # For each matching line...

  # Update count and monthly frequency
  count += 1
  m = substr($4, 6, 2) + 0  # Add zero to convert to 'integer'
  f[m]+= 1

}


END {  # After all lines are read...

  # Find maximum monthly frequency to allow the y-axis to be scaled
  fmax= 0
  for (m= 1; m <= 12; m++)
    if (fmax < f[m])
      fmax= f[m]

  # Output the SVG to display the plot
  svg_tag(0, 0, pw, th+ph+lh, "mplot")
  text_tag(species, 0, th/2, "100%", "title")
  text_tag(sprintf("n=%d", count), pw - 2*lw, th+lw/2, "70%", "label")
  rect_tag(0, th, pw, ph, "frame")
  y = th+ph+lh
  if (fmax == 0)
    sf = 0.0
  else
    sf = 0.9*ph/fmax
  for (m= 1; m <= 12; m++) {
    x = (m-1)*lw
    fh = f[m]*sf
    rect_tag(x, th+ph-fh, lw, fh, "column")
    text_tag(labels[m], x, y, "80%", "label")
  }
  svg_end_tag()

}
