function parse_csv
	cut -d \t -f $argv ~/scrap.csv | uniq -c | sort -r
end
