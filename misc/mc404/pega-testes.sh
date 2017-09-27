#!/bin/bash
#Caio Salvador Rohwedder
#Baixa os testes do labX e seus resultados, faz uma pequena 'correcao' nos .res 

lab=$1
testsPath=$2

if ! command -v curl >/dev/null 2>&1 
then
    echo "Please install curl"
    echo "sudo apt-get install curl"
    exit 1
fi

if ! command -v strings >/dev/null 2>&1 
then
    echo "Please install strings"
    echo "sudo apt-get install strings"
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

URL="https://susy.ic.unicamp.br:9999/mc404abe/%02d/dados/arq%d"  #pagina de download
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

    #baixa arquivo de resposta mas coloca num arquivo temporario
	curl -k $fURL.res -o ${fURL##*/}.pode-dar-ruim >/dev/null 2>/dev/null

    #passa o arquivo temporario pelo mesmo filtro que a saida do lesim passa
    #para facilitar a comparacao
    strings ${fURL##*/}.pode-dar-ruim > ${fURL##*/}.res
    rm ${fURL##*/}.pode-dar-ruim    #remove arquivo temporario
done

echo -en $COLOR_B
echo "Done"
echo -en $COLOR_NC