function column_numbers
	pbpaste > ~/Documents/scrap.csv
head -1 ~/Documents/scrap.csv | tr '\t' '\012' | nl
end
