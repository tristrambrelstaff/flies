# mplot - Monthly Frequency Plot
#
# Example of usage:
#  SPECIES="Tachina fera"; cat Box-*.csv | awk -f mplot.awk -v species="$SPECIES" > "$SPECIES.svg"; firefox --new-window "$SPECIES.svg"

function svg_tag(x, y, w, h, class) {
  printf("<svg viewBox=\"%s %s %s %s\" stroke=\"black\" stroke-opacity=\"1.0\" fill=\"white\" fill-opacity=\"0.0\" class=\"%s\" xmlns=\"http://www.w3.org/2000/svg\">\n", x-10, y-10, w+20, h+20, class)
  # We add 10px margin to ensure that the title and labels are shown no matter which font is used.
}

function svg_end_tag() {
  printf "</svg>\n"
}

function text_tag(str, x, y, font_size, class) {
  printf("<text x=\"%s\" y=\"%s\" font-size=\"%s\" class=\"%s\" fill=\"black\" fill-opacity=\"1.0\">%s</text>\n", x, y, font_size, class, str)
}

function rect_tag(x, y, w, h, sw, class) {
  printf("<rect x=\"%s\" y=\"%s\" width=\"%s\" height=\"%s\" stroke-width=\"%s\" class=\"%s\" fill=\"white\" fill-opacity=\"0.0\" />\n", x, y, w, h, sw, class)
}


BEGIN {  # Before any lines are read...

  # Handle quoted fields properly
  FPAT= "([^,]*)|(\"[^\"]*\")"

  # Set various sizes in pixels
  sw = 2      # stroke width
  th = 30     # title height
  lh = 30     # label height
  lw = 50     # label width
  ph = 400    # plot height
  pw = 12*lw  # plot width

  # Set various font sizes in percentages

  tfs = "200%"  # Title font size
  cfs = "140%"  # Count font size
  lfs = "160%"  # Label font size

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
  text_tag(species, 0, th/2, tfs, "title")
  text_tag(sprintf("n=%d", count), pw - 2*lw, th+lw/2, cfs, "count")
  rect_tag(0, th, pw, ph, sw, "frame")
  y = th+ph+lh
  if (fmax == 0)
    sf = 0.0
  else
    sf = 0.9*ph/fmax
  for (m= 1; m <= 12; m++) {
    x = (m-1)*lw
    fh = f[m]*sf
    rect_tag(x, th+ph-fh, lw, fh, sw, "column")
    text_tag(labels[m], x+4, y, lfs, "label")
  }
  svg_end_tag()

}
