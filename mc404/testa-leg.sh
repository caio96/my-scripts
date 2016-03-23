#!/bin/bash
#Caio Salvador Rohwedder

#Caso nao esteja no PATH coloque o caminho completo desses arquivos
lasm="lasm"
legsim="legsim"

slPath=$1
testsPath=$2

if ! command -v realpath >/dev/null 2>&1 
then
    echo "Please install realpath"
    echo "sudo apt-get install realpath"
    exit 1
fi

if ! command -v strings >/dev/null 2>&1 
then
    echo "Please install strings"
    echo "sudo apt-get install strings"
    exit 1
fi

if ! command -v $legsim >/dev/null 2>&1 
then
    echo "Please check legsim path inside this script"
    exit 1
fi

if ! command -v $lasm >/dev/null 2>&1 
then
    echo "Please check lasm path inside this script"
    exit 1
fi

#Se um dos argumentos estiver vazio
if [ -z "$slPath" -o -z "$testsPath" ]
then
    echo "Usage: ./testa-leg.sh /Path/to/sl-or-s/file /Path/to/tests/dir/"
    exit 1
fi 

if [ ! -e $slPath ] 
then
    echo "Usage: ./testa-leg.sh /Path/to/sl-or-s/file /Path/to/tests/dir/"
    echo "S file not found"
    exit 1
fi

if [ ! -d $testsPath ]
then
     echo "Usage: ./testa-leg.sh /Path/to/sl-or-s/file /Path/to/tests/dir/"
     echo "Tests dir not found"
     exit 1
fi

COLOR_NC='\e[0m'
COLOR_P='\e[1;35m'
COLOR_Y='\e[1;33m'
COLOR_R='\e[1;31m'
diffFile="diff.patch"
testsPath=$(realpath $2)    #caminho absoluto dos testes

slName=$(basename $1)      #so o nome do arquivo
slPath=$(realpath $1)      #caminho absoluto do arquivo
slDir=$(dirname $slPath)  #so o caminho

cd $slDir

exeName=${slName%.*}

$lasm -o $exeName $slName

if [ $? != 0 ]
then
	echo -en $COLOR_R
    echo "Lasm error"
    echo -en $COLOR_NC
    exit 1
fi

cp $exeName $testsPath

cd $testsPath
echo -n "" > $diffFile

for i in $(find -maxdepth 1 -name "*.in" | sort)
do
	echo -en $COLOR_P
	echo $(basename $i) | tee -a $diffFile
	echo "" >> $diffFile
	echo -en $COLOR_NC
	$legsim -l $exeName -lc $i > ${i%.*}.pode-dar-ruim
	strings ${i%.*}.pode-dar-ruim > ${i%.*}.out
	rm ${i%.*}.pode-dar-ruim
	diff ${i%.*}.res ${i%.*}.out >> $diffFile
	echo "" >> $diffFile
done

rm $exeName

echo -en $COLOR_Y
echo "Good Luck!"
echo -en $COLOR_NC