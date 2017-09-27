#!/bin/bash
# Displays only the updated files in a rsync dry run

sourcePath="$1"
targetPath="$2"


if [ ! -d "$sourcePath" ] || [ -z "$sourcePath" ]
then
	echo "Source path error"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

if [ ! -d "$targetPath" ] || [ -z "$targetPath" ]
then
	echo "Target path error"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

sourcePath="$(realpath "$sourcePath")/"
targetPath="$(realpath "$targetPath")/"

SOURCE="${BASH_SOURCE[0]}"
# While $SOURCE is a symlink, resolve it
while [ -h "$SOURCE" ]; do
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$( readlink "$SOURCE" )"
	# If $SOURCE is a relative symlink (so no "/" as prefix, 
	# we need to resolve it relative to the symlink base directory
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
scriptDir="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $scriptDir

if [ ! -e output-rsync.py ]
then
	echo "Error, output-rsync.py not found"
	echo "Usage: $0 sourcePath/ targetPath/"
	exit 1
fi

rsyncCommand='rsync -ahv --exclude='.git/' --stats --progress -i '

$rsyncCommand --dry-run "$sourcePath" "$targetPath" > out.txt
python output-rsync.py out.txt
rm out.txt

echo ""
echo "This was a dry-run"
echo "You can run it with:"
echo "$rsyncCommand $sourcePath $targetPath"
