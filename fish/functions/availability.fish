function availability
	for i in (cat ~/Documents/scrap/mappings.txt); 
		echo \n $i
		python data_parser.py $argv -a -field $i;
	end
end
