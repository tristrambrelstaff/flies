FILES=flies.csv families.csv species.csv locations.csv keys.csv todo.Anthomyiidae.csv todo.Asilidae.csv todo.Bibionidae.csv todo.Bombyliidae.csv todo.Calliphoridae.csv todo.Clusiidae.csv todo.Coelopidae.csv todo.Conopidae.csv todo.Dryomyzidae.csv todo.Ephydridae.csv todo.Fannia_lustrator.csv todo.Fanniidae.csv todo.Heleomyzidae.csv todo.Hippoboscidae.csv todo.Lauxaniidae.csv todo.Lonchaeidae.csv todo.Lonchopteridae.csv todo.Muscidae.csv todo.Opomyzidae.csv todo.Pallopteridae.csv todo.Panorpidae.csv todo.Platypezidae.csv todo.Rhagionidae.csv todo.Rhinophoridae.csv todo.Sarcophagidae.csv todo.Scathophagidae.csv todo.Sciomyzidae.csv todo.Sepsidae.csv todo.Sphaeroceridae.csv todo.Stratiomyidae.csv todo.Tabanidae.csv todo.Tachinidae.csv todo.Tephritidae.csv todo.Therevidae.csv todo.Trichoceridae.csv todo.Ulidiidae.csv

all: ${FILES}

clean:
	rm --force ${FILES} mplots/*.svg

flies.csv: Box-*.csv
	tail --lines=+2 --quiet Box-*.csv >$@

families.csv: Box-*.csv
	cat Box-*.csv | csvfix summary -frq 6 | csvfix order -f 7,1 | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@

species.csv: Box-*.csv
	cat Box-*.csv | csvfix summary -frq 6,7 | csvfix order -f 7,8,1 | csvfix unique -f 1,2 | csvfix sort -f 1,2 -rh >$@

locations.csv: Box-*.csv
	cat Box-*.csv | csvfix summary -frq 3 | csvfix order -f 4,1 | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@

keys.csv: Box-*.csv
	cat Box-*.csv | csvfix summary -frq 9 | csvfix order -f 10,1 | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@

# grep returns exit status 2 on finding no matches so we use '|| true' to prevent this being treated as an error:

todo.Anthomyiidae.csv: Box-*.csv
	grep Anthomyiidae B*csv | grep -v "Ackland" >$@ || true

todo.Asilidae.csv: Box-*.csv
	grep Asilidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Bibionidae.csv: Box-*.csv
	grep Bibionidae B*csv | grep -v "Freeman & Lane, 1985" >$@ || true

todo.Bombyliidae.csv: Box-*.csv
	grep Bombyliidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Calliphoridae.csv: Box-*.csv
	grep Calliphoridae B*csv | grep -v "Rognes, 1991" >$@ || true

odo.Clusiidae.csv: Box-*.csv
	grep Clusiidae B*csv | grep -v "Stubbs, 1982" >$@ || true

todo.Coelopidae.csv: Box-*.csv
	grep Coelopidae B*csv | grep -v "Shtakelberg, 1989" >$@ || true

todo.Conopidae.csv: Box-*.csv
	grep Conopidae B*csv | grep -v "Clements, 1995" >$@ || true

todo.Dryomyzidae.csv: Box-*.csv
	grep Dryomyzidae B*csv | grep -v "Shtakelberg, 1989" >$@ || true

todo.Ephydridae.csv: Box-*.csv
	grep Ephydridae B*csv | grep -v "Narchuk, 1989" | grep -v "Drake, 2006" >$@ || true

todo.Fannia_lustrator.csv: Box-*.csv
	grep "Fannia lustrator" B*csv | grep -v "Rozkosny et al, 1997" >$@ || true

todo.Fanniidae.csv: Box-*.csv
	grep Fanniidae B*csv | grep -v "Rozkosny et al, 1997" >$@ || true

todo.Heleomyzidae.csv: Box-*.csv
	grep Heleomyzidae B*csv | grep -v "Sivell & Stubbs draft key, 2020" >$@ || true

todo.Hippoboscidae.csv: Box-*.csv
	grep Hippoboscidae B*csv | grep -v "Hutson, 1984" >$@ || true

todo.Lauxaniidae.csv: Box-*.csv
	grep Lauxaniidae B*csv | grep -v "Shatalkin, 2000" >$@ || true

todo.Lonchopteridae.csv: Box-*.csv
	grep Lonchopteridae B*csv | grep -v "Smith, 1969" >$@ || true

todo.Lonchaeidae.csv: Box-*.csv
	grep Lonchaeidae B*csv | grep -v "MacGowan & Rotheray, 2008" >$@ || true

todo.Muscidae.csv: Box-*.csv
	grep Muscidae B*csv | grep -v "Fonseca, 1968" | grep -v "Gregor et al, 2016" >$@ || true

todo.Opomyzidae.csv: Box-*.csv
	grep Opomyzidae B*csv | grep -v "Drake, 1993" >$@ || true

todo.Pallopteridae.csv: Box-*.csv
	grep Pallopteridae B*csv | grep -v "Collin, 1951" >$@ || true

todo.Panorpidae.csv: Box-*.csv
	grep Panorpidae B*csv | grep -v "Fraser, 1959" >$@ || true

todo.Platypezidae.csv: Box-*.csv
	grep Platypezidae B*csv | grep -v "Chandler, 2001" >$@ || true

todo.Rhagionidae.csv: Box-*.csv
	grep Rhagionidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Rhinophoridae.csv: Box-*.csv
	grep Rhinophoridae B*csv | grep -v "Falk draft key, 2016" >$@ || true

todo.Sarcophagidae.csv: Box-*.csv
	grep Sarcophagidae B*csv | grep -v "Pape, 1987" | grep -v "Richet et al, 2011" >$@ || true

todo.Scathophagidae.csv: Box-*.csv
	grep Scathophagidae B*csv | grep -v "Ball, 2014" >$@ || true

todo.Sciomyzidae.csv: Box-*.csv
	grep Sciomyzidae B*csv | grep -v "Rozkosny, 1984" >$@ || true

todo.Sepsidae.csv: Box-*.csv
	grep Sepsidae B*csv | grep -v "Pont & Meier, 2002" >$@ || true

todo.Sphaeroceridae.csv: Box-*.csv
	grep Sphaeroceridae B*csv | grep -v "Pitkin, 1988" >$@ || true

todo.Stratiomyidae.csv: Box-*.csv
	grep Stratiomyidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Tabanidae.csv: Box-*.csv
	grep Tabanidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Tachinidae.csv: Box-*.csv
	grep Tachinidae B*csv | grep -v "Belshaw, 1993" >$@ || true

todo.Tephritidae.csv: Box-*.csv
	grep Tephritidae B*csv | grep -v "White, 1988" >$@ || true

todo.Therevidae.csv: Box-*.csv
	grep Therevidae B*csv | grep -v "Stubbs & Drake, 2001" >$@ || true

todo.Trichoceridae.csv: Box-*.csv
	grep Trichoceridae B*csv | grep -v "Coe et al, 1950" >$@ || true

todo.Ulidiidae.csv: Box-*.csv
	grep Ulidiidae B*csv | grep -v "Clements, 1990" >$@ || true
