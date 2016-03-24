#!/bin/bash
#Caio Salvador Rohwedder
#Monta e roda o simulador LEG
#Gera os arquivos .out com o resultado de cada teste

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
    echo "Please install the terminal command 'strings'"
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

#define de cores
COLOR_NC='\e[0m'
COLOR_P='\e[1;35m'
COLOR_Y='\e[1;33m'
COLOR_R='\e[1;31m'

testsPath=$(realpath $2)    #caminho absoluto dos testes
diffFile="diff.patch"

slName=$(basename $1)       #so o nome do arquivo
slPath=$(realpath $1)       #caminho absoluto do arquivo
slDir=$(dirname $slPath)    #so o caminho

cd $slDir                   #entra da pasta do .sl

exeName=${slName%.*}        #pega nome do .sl sem a extencao

$lasm -o $exeName $slName   #cria executavel

if [ $? != 0 ]
then
	echo -en $COLOR_R
    echo "Lasm error"
    echo -en $COLOR_NC
    exit 1
fi

cp $exeName $testsPath 2> /dev/null     #copia executavel para pasta de testes, evita erros do legsim

cd $testsPath                           #entra na pasta de testes
echo -n "" > $diffFile                     #cria ou limpa o arquivo de diff na pasta de testes

#executa o simulador para todos os .in
for i in $(find -maxdepth 1 -name "*.in" | sort)
do
	echo -en $COLOR_P
	echo $(basename $i) | tee -a $diffFile
    echo -en $COLOR_NC
    echo "" >> $diffFile

    #roda simulador leg carregado com o executavel e executa os comandos de um arquivo .in
    #coloca a saida num arquivo temporario 
	$legsim -l $exeName -lc $i > ${i%.*}.pode-dar-ruim     
	
    #limpa qualquer 'sujeira' da saida do leg e coloca saida no .out
    strings ${i%.*}.pode-dar-ruim > ${i%.*}.out     
	rm ${i%.*}.pode-dar-ruim   #remove arquivo temporario

    diff -yt ${i%.*}.res ${i%.*}.out >> $diffFile   #faz o diff (side by side)
    
    #da um espaco entre cada teste no arquivo
    for i in $(seq 1 5)
    do
        echo "" >> $diffFile
    done
done

#remove copia do arquivo executavel se a pasta de testes for diferente da pasta do .sl
if [ $(realpath $exeName) != $(realpath $slDir/$exeName) ]
then
    rm $exeName                    
fi

echo -en $COLOR_Y
echo "Good Luck!"
echo -en $COLOR_NC