function parse_csv
	cut -d \t -f $argv ~/Documents/scrap/data.csv | uniq -c | sort -r
end
