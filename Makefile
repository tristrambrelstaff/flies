all: flies.csv

flies.csv: Box-*.csv
	tail --lines=+2 --quiet Box-*.csv >flies.csv
