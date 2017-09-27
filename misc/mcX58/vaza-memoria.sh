#!/bin/bash
#Caio Salvador Rohwedder
#Compila e roda os testes do programa, e ve se nao vazou memoria durante a execucao de cada teste
#Gera o arquivo memory.txt na pasta dos testes, ele contem os resultados do valgrind

cppPath=$1
testsPath=$2

if ! command -v realpath >/dev/null 2>&1
then
    echo "Please install realpath"
    echo "sudo apt-get install realpath"
    exit 1
fi

if ! command -v valgrind >/dev/null 2>&1
then
    echo "Please install valgrind"
    echo "sudo apt-get install valgrind"
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
outputFile="memory.txt"

cppName=$(basename $1)      #so o nome do arquivo
cppPath=$(realpath $1)      #caminho absoluto do arquivo
cppDir=$(dirname $cppPath)  #so o caminho

cd $cppDir                  #entra na pasta do .cpp

exeName=${cppName%.*}       #nome do arquivo sem extensao

g++ -Wall -o $exeName $cppPath      #compila o codigo

if [ $? != 0 ]
then
    echo "Code was not compiled"
    exit 1
fi

exePath=$cppDir/$exeName
allright=1                  #flag para ver se todos os resultados foram corretos, 1 == foram

cd $testsPath               #entra na pasta de testes
echo -n  "" > $outputFile   #cria ou limpa o arquivo de memoria na pasta de testes

correctNum=0                #numero de testes corretos

#roda para todos os arquivos .in
for i in $(find $(pwd) -maxdepth 1 -name "*.in" | sort)
do
    echo -n $(basename $i) | tee -a $outputFile
    echo "" >> $outputFile

    #executa o programa com valgrind
    valgrind -q --track-origins=yes --leak-check=full --error-exitcode=1 $exePath < $i 2>> $outputFile >/dev/null

    #escreve o resultado na tela
    if [ $? != 0 ]
    then
        echo -n " -> "
        echo -en $COLOR_R
        echo "Memory leak"
        echo -en $COLOR_NC
        allright=0
    else
        echo -n " -> "
        echo -en $COLOR_P
        echo "No memory leak"
        echo -en $COLOR_NC
        correctNum=$((correctNum+1))
    fi

    echo "" | tee -a $outputFile
done

#se nao houver vazamento nenhum
if [ $allright == 1 ]
then
    echo -en $COLOR_Y
    echo "Valgrind approved code!!!"
    echo -en $COLOR_NC
else #se nao printa o numero de corretos
    echo -en $COLOR_Y
    echo "$correctNum rights, let's go!"
    echo -en $COLOR_NC
fi
