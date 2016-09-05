#!/bin/bash
#displays only the updated files in a rsync dry run

sourcePath="$1"
targetPath="$2"

if [ ! -d $sourcePath ] || [ -z $sourcePath ]
then
	echo "Error"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

if [ ! -d $targetPath ] || [ -z $targetPath ]
then
	echo "Error"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $scriptDir

if [ ! -e output-rsync.py ] 
then
	echo "Error, python script not found"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

rsync -ahv --stats --dry-run --progress -i "$sourcePath" "$targetPath" > nana.txt
python output-rsync.py nana.txt
rm nana.txt

echo "You can run this with:"
echo "rsync -ahv --stats --progress -i $sourcePath $targetPath"