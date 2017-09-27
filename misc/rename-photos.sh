#!/bin/bash
# Renames photos with their date information

name=$1
folder=$2

if [ -z "$name" ]
then
    echo "Name error"
    echo "Usage: $0 name /target/Path/"
    exit 1
fi

if [ -z "$folder" ] || [ ! -d "$folder" ]
then
    echo "Source target path error"
    echo "Usage: $0 name /target/Path/"
    exit 1
fi

cd $folder

for i in *.jpg
do
    #lastDate=$(identify -verbose $i | grep -i date | tail -n 1 | cut -d ' ' -f6 | sed 's/T/-/' | sed 's/:/-/g')
    lastDate=$(identify -verbose $i | grep -i date | tail -n 1)
    echo $lastDate

    echo $lastDate | grep "exif" &> /dev/null

    #true if has found exif
    if [[ $? == 0 ]]
    then
        finalDate=$(echo $lastDate | cut -d ' ' -f 2,3 | sed s/:/-/g | sed s/\ /-/g)
    else
        finalDate=$(echo $lastDate | cut -d ' ' -f 2 | sed 's/T/-/' | sed 's/:/-/g')
    fi
    echo $finalDate

    mv $i $name-$finalDate.jpg
done
