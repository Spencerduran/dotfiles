function parse_csv
	cut -d \t -f $argv ~/Documents/scrap.csv | uniq -c | sort -r
end
