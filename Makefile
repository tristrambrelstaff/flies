all: flies.csv locations.csv keys.csv

flies.csv: Box-*.csv
	tail --lines=+2 --quiet Box-*.csv >$@

locations.csv: Box-*.csv
	csvfix order -f 3 Box-*.csv | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@

keys.csv: Box-*.csv
	csvfix order -f 9 Box-*.csv | csvfix unique -f 1 | csvfix sort -f 1 -rh >$@
