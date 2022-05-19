#!/bin/bash

echo "hexo generate and deploy start"
hexo d -g
echo "hexo generate and deploy end"
echo "git push remote repo start"
git add .
git commit -m "add new blog"
git push
echo "git push remote repo end"
