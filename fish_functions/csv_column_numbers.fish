function csv_column_numbers
	head -n 1 $argv | tr ',' '\012' | nl
end
