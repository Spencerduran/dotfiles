function availability
	for i in (cat ~/Documents/scrap/mappings.txt); python data_parser.py $argv -a $i; end
end
