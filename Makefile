FILES=flies.csv families.csv species.csv locations.csv keys.csv todo.Asilidae.csv todo.Bibionidae.csv todo.Bombyliidae.csv todo.Coelopidae.csv todo.Calliphoridae.csv todo.Dryomyzidae.csv todo.Fannia_lustrator.csv todo.Lonchopteridae.csv todo.Muscidae.csv todo.Rhagionidae.csv todo.Sarcophagidae.csv todo.Scathophagidae.csv todo.Sciomyzidae.csv todo.Sphaeroceridae.csv todo.Stratiomyidae.csv todo.Tabanidae.csv todo.Tachinidae.csv todo.Tephritidae.csv todo.Therevidae.csv

all: ${FILES}

clean:
	rm --force ${FILES}

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

# grep returns exit status 2 on finding no matches so we use '-' to prevent this being treated as an error:

todo.Asilidae.csv: Box-*.csv
	- grep Asilidae B*csv | grep -v "Stubbs & Drake, 2001" >$@

todo.Bibionidae.csv: Box-*.csv
	- grep Bibionidae B*csv | grep -v "Freeman & Lane, 1985" >$@

todo.Bombyliidae.csv: Box-*.csv
	- grep Bombyliidae B*csv | grep -v "Stubbs & Drake, 2001" >$@

todo.Coelopidae.csv: Box-*.csv
	- grep Coelopidae B*csv | grep -v "Shtakelberg, 1989" >$@

todo.Calliphoridae.csv: Box-*.csv
	- grep Calliphoridae B*csv | grep -v "Rognes, 1991" >$@

todo.Dryomyzidae.csv: Box-*.csv
	- grep Dryomyzidae B*csv | grep -v "Shtakelberg, 1989" >$@

todo.Fannia_lustrator.csv: Box-*.csv
	- grep "Fannia lustrator" B*csv | grep -v "Rozkosny et al, 1997" >$@

todo.Lonchopteridae.csv: Box-*.csv
	- grep Lonchopteridae B*csv | grep -v "Smith, 1969" >$@

todo.Muscidae.csv: Box-*.csv
	- grep Muscidae B*csv | grep -v "Fonseca, 1968" >$@

todo.Rhagionidae.csv: Box-*.csv
	- grep Rhagionidae B*csv | grep -v "Stubbs & Drake, 2001" >$@

todo.Sarcophagidae.csv: Box-*.csv
	- grep Sarcophagidae B*csv | grep -v "Pape, 1987" >$@

todo.Scathophagidae.csv: Box-*.csv
	- grep Scathophagidae B*csv | grep -v "Ball, 2014" >$@

todo.Sciomyzidae.csv: Box-*.csv
	- grep Sciomyzidae B*csv | grep -v "Rozkosny, 1984" >$@

todo.Sphaeroceridae.csv: Box-*.csv
	- grep Sphaeroceridae B*csv | grep -v "Pitkin, 1988" >$@

todo.Stratiomyidae.csv: Box-*.csv
	- grep Stratiomyidae B*csv | grep -v "Stubbs & Drake, 2001" >$@

todo.Tabanidae.csv: Box-*.csv
	- grep Tabanidae B*csv | grep -v "Stubbs & Drake, 2001" >$@

todo.Tachinidae.csv: Box-*.csv
	- grep Tachinidae B*csv | grep -v "Belshaw, 1993" >$@

todo.Tephritidae.csv: Box-*.csv
	- grep Tephritidae B*csv | grep -v "White, 1988" >$@

todo.Therevidae.csv: Box-*.csv
	- grep Therevidae B*csv | grep -v "Stubbs & Drake, 2001" >$@
