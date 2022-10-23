function tables
rg -i $argv | rg salesforce | awk '{print $1}' | uniq
end
