#!/bin/bash
# Author: Diego Narducci
# E-mail: diego.narducci88@gmail.com

#Versão 0.1a -> Versão inicial.
######################################################
#Programa utiliza o cmd ps para localizar qual programa ou cmd foi imediatamente aberto ou fechado.
#Criei esse script por uma necessidade minha em localizar o que foi executado no linux, facilitando minha vida para localizar em vez de ficar procurando o proigrama atravez do programa PS

######################################################

ps -xo cmd > antes.txt
clear
echo "abra ou feche o programa que deseja descobrir o nome e depois pressione enter..."
read
echo ""
ps -xo cmd > depois.txt

lista=$(diff antes.txt depois.txt | grep -E ">|<")

for i in "$lista"
do
	if [[ $i = \>* ]]
	then

		echo "$i" | sed 's/^> /Processo aberto: /g'
	fi

	if [[ $i = \<* ]]
	then
		echo "$i" | sed 's/^< /Processo fechado: /g'
	fi
done

rm -f antes.txt depois.txt
