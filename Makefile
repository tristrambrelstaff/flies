FILES=flies.csv families.csv species.csv locations.csv keys.csv

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
