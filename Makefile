FILES=flies.csv locations.csv keys.csv

all: ${FILES}

clean:
	rm --force ${FILES}

flies.csv: Box-*.csv
	tail --lines=+2 --quiet Box-*.csv >$@

locations.csv: Box-*.csv
	csvfix summary -frq 3 Box-*.csv | csvfix order -f 4,1 | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@

keys.csv: Box-*.csv
	csvfix summary -frq 9 Box-*.csv | csvfix order -f 10,1 | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@
