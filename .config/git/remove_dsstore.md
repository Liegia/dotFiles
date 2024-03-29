touch .gitignore

add: .DS_Store

git rm -r --cached .
git add .
git commit -am "Removed git ignored files"
git push -f origin master
