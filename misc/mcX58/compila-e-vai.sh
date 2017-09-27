#!/bin/bash
#Caio Salvador Rohwedder
#Compila e roda os testes do programa, mostrando se passou no teste ou nao
#Gera os arquivos .out e um arquivo diff.patch na pasta dos testes que contem cada diff

cppPath=$1
testsPath=$2

if ! command -v realpath >/dev/null 2>&1
then
    echo "Please install realpath"
    echo "sudo apt-get install realpath"
    exit 1
fi

#Se um dos argumentos estiver vazio
if [ -z "$cppPath" -o -z "$testsPath" ]
then
    echo "Usage: $0 /Path/to/cpp/file /Path/to/tests/dir/"
    exit 1
fi

if [ ! -e $cppPath ]
then
    echo "Usage: $0 /Path/to/cpp/file /Path/to/tests/dir/"
    echo "C++ file not found"
    exit 1
fi

if [ ! -d $testsPath ]
then
     echo "Usage: $0 /Path/to/cpp/file /Path/to/tests/dir/"
     echo "Tests dir not found"
     exit 1
fi

#define as cores
COLOR_NC='\e[0m'
COLOR_P='\e[1;35m'
COLOR_Y='\e[1;33m'
COLOR_R='\e[1;31m'

testsPath=$(realpath $2)    #caminho absoluto dos testes
diffFile="diff.patch"

cppName=$(basename $1)      #so o nome do arquivo
cppPath=$(realpath $1)      #caminho absoluto do arquivo
cppDir=$(dirname $cppPath)  #so o caminho

cd $cppDir                  #entra na pasta do .cpp

exeName=${cppName%.*}       #nome do arquivo sem extensao

g++ -ansi -pedantic -Wall -lm -o $exeName $cppPath      #compila o codigo

if [ $? != 0 ]
then
    echo "Code was not compiled"
    exit 1
fi

exePath=$cppDir/$exeName
allright=1                  #flag para ver se todos os resultados foram corretos, 1 == foram

cd $testsPath               #entra na pasta de testes
echo -n  "" > $diffFile     #cria ou limpa o arquivo de diff na pasta de testes

correctNum=0                #numero de testes corretos

#roda para todos os arquivos .in
for i in $(find $(pwd) -maxdepth 1 -name "*.in" | sort)
do
    echo -n $(basename $i) | tee -a $diffFile
    echo "" >> $diffFile
    $exePath < $i > ${i%.*}.out                 #executa o programa
    diff ${i%.*}.res ${i%.*}.out >> $diffFile   #faz o diff

    #pega a saida do diff e escreve na tela
    if [ $? != 0 ]
    then
        echo -n " -> "
        echo -en $COLOR_R
        echo "Files differ"
        echo -en $COLOR_NC
        allright=0
    else
        echo -n " -> "
        echo -en $COLOR_P
        echo "Correct result"
        echo -en $COLOR_NC
        correctNum=$((correctNum+1))
    fi

    echo "" | tee -a $diffFile
done

#se todos os resultados forem corretos
if [ $allright == 1 ]
then
    echo -en $COLOR_Y
    echo "Susy approved code!!!"
    echo -en $COLOR_NC
else #se nao printa o numero de corretos
    echo -en $COLOR_Y
    echo "$correctNum rights, let's go!"
    echo -en $COLOR_NC
fi
