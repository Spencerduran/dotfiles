function cpwd
	pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'
end
