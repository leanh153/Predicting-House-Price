#!/bin/bash
# author: Le Van Anh
# get current working dir name
wd=$( echo $PWD | sed -E 's#(^\/.*)*\/##' )
echo "working dir: $wd "
# Create README.md file
echo "Creating README.md"
> README.md
# Get Project's name for README.md title
project_name=$( echo $wd | sed -E 's#[-_]# #g' )
echo "Project name: $project_name"
echo "# $project_name


 " >> README.md

echo "
## How to run

open with [google colab ](https://colab.research.google.com/notebooks/)



## What's included


\`\`\`text" >> README.md

# get tree picture
tree_pic=""
if [ "$1" == "-L" ];then
	echo "Contain -L need deep tree"
	cd ..
	tree  $1 $2 $wd >> $wd/README.md
	cd $wd
else
	echo "No contain deep tree option."
	cd ..
	tree $wd >> $wd/README.md
	cd $wd
fi

echo "\`\`\`

" >> README.md
echo "Complete!"
# zipping files
echo "zipping files"

zip -r ../$wd.zip *