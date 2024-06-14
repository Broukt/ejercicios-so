#!/usr/bin/bash

read -p "Ingrese el primer numero: " firstNumber

if [[ ! $firstNumber =~ ^-?[0-9]+$ ]];
then
  echo "Ingrese un valor valido"
  exit 1
fi

read -p "Ingrese el segundo numero: " secondNumber

if [[ ! $secondNumber =~ ^-?[0-9]+$ ]];
then
  echo "Ingrese un valor valido"
  exit 1
fi

if [ $firstNumber -lt $secondNumber ];
then
  aux=$firstNumber
  firstNumber=$secondNumber
  secondNumber=$aux
fi

for i in $(seq $firstNumber -1 $secondNumber);
do
  echo "$i"
done
