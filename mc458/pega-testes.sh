#!/bin/bash
#Caio Salvador Rohwedder
#Baixa os testes do labX e seus resultados 

lab=$1
testsPath=$2

if ! command -v curl >/dev/null 2>&1 
then
    echo "Please install curl"
    echo "sudo apt-get install curl"
    exit 1
fi

#Se um dos argumentos estiver vazio
if [ -z "$lab" -o -z "$testsPath" ]
then
	echo "Usage: ./pega-testes.sh [lab-number] /Path/to/tests/folder/"
	exit 1
fi 

if [ ! -d $testsPath ]
then
     echo "Usage: ./pega-testes.sh [lab-number] /Path/to/tests/folder/"
     echo "Tests dir not found"
     exit 1
fi

#define de cores
COLOR_NC='\e[0m'
COLOR_B='\e[1;34m'

URL="https://susy.ic.unicamp.br:9999/mc458ab/%02d/dados/arq%02d"  #pagina de download
testNum=0       #contador de testes

cd $testsPath   #entra na pasta de testes
 
#baixa os .in e descobre quantos sao
while true
do
	testNum=$((testNum+1))
	fURL=$(printf $URL $lab $testNum)

    curl -k $fURL.in -o ${fURL##*/}.in >/dev/null 2>/dev/null   #baixa teste
    grep -q "inexistente" ${fURL##*/}.in >/dev/null             #ve se teste existe

    #para quando achar teste 'inexistente'
    if [ $? == 0 ]
	then
		rm ${fURL##*/}.in
    	testNum=$((testNum-1))
    	break
    else
    	echo ${fURL##*/}.in
    fi
done

#baixa os .res
for i in $(seq 1 $testNum)
do
	fURL=$(printf $URL $lab $i)
	echo ${fURL##*/}.res
	curl -k $fURL.res -o ${fURL##*/}.res >/dev/null 2>/dev/null
done

echo -en $COLOR_B
echo "Done"
echo -en $COLOR_NC