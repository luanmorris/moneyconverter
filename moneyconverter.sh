#!/bin/bash

echo ""
echo "****************************************"
echo "*           MONEY CONVERTER            *"
echo "****************************************"
echo ""

cot=$(wget -qO- https://investing.com/currencies/usd-brl | grep last_last | sed -e 's/<[^>]*>//g')

echo -e Cotação do Dolar hoje $(date +"%d/%m/%Y") é R\$$cot.
echo ""

echo "Converter de:"
echo "1. BRL para USD"
echo "2. USD para BRL"
echo ""

echo "Digite sua opção:"
read choice
echo ""

echo "Digite o valor a ser convertido:"
read value
echo ""

brlusd=$(bc <<< "scale=4; $value / $cot")
usdbrl=$(bc <<< "scale=4; $value * $cot")

if [ $choice == 1 ];
then 
	echo "R\$$value equivale à U\$$brlusd"
elif [ $choice == 2 ];
then 
	echo "U\$$value equivale à R\$$usdbrl"
else 
	echo "Opção inválida."
fi

