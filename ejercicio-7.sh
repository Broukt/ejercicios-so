#!/usr/bin/bash

if [ "$#" -eq 0 ];
then
  echo "No se recibieron parametros"
  exit 1
fi

if [ "$#" -gt 1 ];
then
  echo "Se recibio mas de un parametro"
  exit 1
fi

count=$1

if [[ ! $count =~ ^[0-9]+$ ]];
then
  echo "Ingrese un valor valido"
  exit 1
fi

for i in $(seq 1 $count);
do
  echo -n "@"
done

echo
