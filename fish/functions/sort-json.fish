function sort-json
	jsonsort $argv -a
	underscore print < $argv | cat > pretty.json
	mv pretty.json $argv
end
