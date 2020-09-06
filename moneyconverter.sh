#!/bin/bash

cot=$(wget -qO- https://investing.com/currencies/usd-brl | grep last_last | sed -e 's/<[^>]*>//g')

echo -e Cotação do Dolar hoje $(date +"%d/%m/%Y") é R\$$cot.

echo "Digite o valor:"
read value

conv=$(bc <<< "scale=4; $value / $cot")

echo "R\$$value equivale à U\$$conv"

