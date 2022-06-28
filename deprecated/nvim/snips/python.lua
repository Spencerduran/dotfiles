snippet check_list_values "Check list against another list"
import json
items = []
compare = []
for i in items:
	if i not in compare:
		print(i,k)
endsnippet

snippet open_json "Exctract json from file"
with open("filename_path", "r") as file:
	data = json.load(file)
endsnippet

snippet argparse "Generic argparse setup"
parser = argparse.ArgumentParser(description='')
parser.add_argument('-arg', action='store_true',
parser.add_argument('-use_timestamps', action='store',
args = parser.parse_args()
#if not (args.):
#    parser.error('no method specified')
endsnippet

snippet string_in_file "Find string in file, return line its on"
def search_string_in_file(file_name, string_to_search):
	"""Search for the given string in file and return lines containing that string,
	along with line numbers"""
	line_number = 0
	list_of_results = []
	# Open the file in read only mode
	with open(file_name, 'r') as read_obj:
		# Read all lines in the file one by one
		for line in read_obj:
			# For each line, check if line contains the string
			line_number += 1
			if string_to_search in line:
				# If yes, then add the line number & line as a tuple in the list
				list_of_results.append((line_number, line.rstrip()))
	# Return list of tuples containing line numbers and lines where string is found
	return list_of_results
endsnippet

