#!/bin/bash
# Checa se um site foi atualizado a cada 10 seconds, 
# como por exemplo se um professor liberou uma nota
# Fica rodando e quando o site é atualizado faz um beep

COLOR_NC='\e[0m'
COLOR_B='\e[1;34m'

if ! command -v beep >/dev/null 2>&1 
then
    echo "Please set a beep, for example:"
    echo "alias beep='paplay /usr/share/sounds/ubuntu/stereo/phone-outgoing-calling.ogg'"
    exit 1
fi

adress=$1

if [ -z "$adress" ]
then
	echo "Usage: ./anxiety-check.sh https://www.web.adress/"
	exit 1
fi

wget -q $adress -O first.html

while [ true ]
do
	wget -q $adress -O second.html
	diff -q first.html second.html
	if [ $? -ne 0 ]
	then
		break
	fi
	echo "Not Yet"
	sleep 10s
done

rm first.html
rm second.html

echo ""
echo -en $COLOR_B
echo "Done"
echo -en $COLOR_NC

beep