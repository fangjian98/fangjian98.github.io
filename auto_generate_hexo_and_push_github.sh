#!/bin/bash

echo "hexo generate and deploy start"
hexo clean
hexo d -g
echo "hexo generate and deploy end"
echo "git push remote repo start"
git add .
if [ $# -lt 1 ];then
	git commit -m "add new blog"	
else
	git commit -m "$1"
fi
git push
echo "git push remote repo end"
