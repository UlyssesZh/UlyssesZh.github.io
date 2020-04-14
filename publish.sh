MESSAGE=$1

echo "Committing..."
git commit -m "$MESSAGE" --author "Ulysses <2938747508@qq.com>"

echo "Backing up..."
mv _site/.git git_backup

echo "Building..."
jekyll build --quiet

echo "Restoring..."
mv git_backup/.git _site
cd _site

echo "Pushing..."
git add -- **/*
git commit -m "$MESSAGE" --author "Ulysses <2938747508@qq.com>"
git push --set-upstream origin master
