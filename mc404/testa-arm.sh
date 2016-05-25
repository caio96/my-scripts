#!/bin/bash
#Caio Salvador Rohwedder
#Monta e roda o simulador LEG
#Gera os arquivos .out com o resultado de cada teste
#Caso tenha dispositivos, colocar o devices.txt dentro da pasta de testes, 
#e colocar so um teste.in com 'g rotulo-inicial' nela

#Caso nao esteja no PATH coloque o caminho completo desses arquivos
armsim="armsim"

sPath=$1
testsPath=$2

if ! command -v realpath >/dev/null 2>&1 
then
    echo "Please install realpath"
    echo "sudo apt-get install realpath"
    exit 1
fi

if ! command -v $armsim >/dev/null 2>&1 
then
    echo "Please check armsim path inside this script"
    exit 1
fi

#Se um dos argumentos estiver vazio
if [ -z "$sPath" -o -z "$testsPath" ]
then
    echo "Usage: ./testa-arm.sh /Path/to/s/file /Path/to/tests/dir/"
    exit 1
fi 

if [ ! -e $sPath ] 
then
    echo "Usage: ./testa-arm.sh /Path/to/s/file /Path/to/tests/dir/"
    echo "S file not found"
    exit 1
fi

if [ ! -d $testsPath ]
then
     echo "Usage: ./testa-arm.sh /Path/to/s/file /Path/to/tests/dir/"
     echo "Tests dir not found"
     exit 1
fi

#define de cores
COLOR_NC='\e[0m'
COLOR_P='\e[1;35m'
COLOR_Y='\e[1;33m'
COLOR_R='\e[1;31m'

testsPath=$(realpath $2)    #caminho absoluto dos testes
diffFile="diff.patch"

sName=$(basename $1)       #so o nome do arquivo
sPath=$(realpath $1)       #caminho absoluto do arquivo
sDir=$(dirname $sPath)    #so o caminho

cd $sDir                   #entra da pasta do .sl

exeName=${sName%.*}        #pega nome do .sl sem a extencao

#monta
arm-none-eabi-as -o $exeName.o $sName       
if [ $? != 0 ]
then
    echo -en $COLOR_R
    echo "arm-none-eabi-ld error"
    echo -en $COLOR_NC
    exit 1
fi

#liga
arm-none-eabi-ld -Tmapa.lds -o $exeName $exeName.o     
if [ $? != 0 ]
then
	echo -en $COLOR_R
    echo "arm-none-eabi-as error"
    echo -en $COLOR_NC
    exit 1
fi

cp $exeName $testsPath 2> /dev/null     #copia executavel para pasta de testes, evita erros do legsim

cd $testsPath                           #entra na pasta de testes
echo -n "" > $diffFile                  #cria ou limpa o arquivo de diff na pasta de testes

#executa o simulador para todos os .in
for i in $(find -maxdepth 1 -name "*.in" | sort)
do
	echo -en $COLOR_P
	echo $(basename $i) | tee -a $diffFile
    echo -en $COLOR_NC
    echo "" >> $diffFile

    #roda simulador leg carregado com o executavel e executa os comandos de um arquivo .in
    $armsim -l $exeName -lc $i > ${i%.*}.out     
    
    diff -yt ${i%.*}.res ${i%.*}.out >> $diffFile   #faz o diff (side by side)
    
    #da um espaco entre cada teste no arquivo
    for i in $(seq 1 5)
    do
        echo "" >> $diffFile
    done
done

#remove copia do arquivo executavel se a pasta de testes for diferente da pasta do .sl
if [ $(realpath $exeName) != $(realpath $sDir/$exeName) ]
then
    rm $exeName                    
fi

echo -en $COLOR_Y
echo "Good Luck!"
echo -en $COLOR_NC