function my_branches
git for-each-ref --sort=authorname --format "%(authorname) %(refname)" | rg -i spence
end
