function column_numbers
	pbpaste > ~/scrap.csv
head -1 ~/scrap.csv | tr '\t' '\012' | nl
end
