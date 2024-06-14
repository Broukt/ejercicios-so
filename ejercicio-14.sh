#!/usr/bin/bash

if [ ! $# -eq 2 ];
then
  echo "Se debe recibir 2 parametros por entrada"
  echo "Uso: $0 [1-60] [1-10]"
  exit 1
fi

if [[ ! $1 =~ ^[0-9]+$ ]] || [ $1 -lt 1 ] || [ $1 -gt 60 ];
then
  echo "Primer parametro invalido. Debe ser un numero entre 1 y 60"
  exit 1
fi

if [[ ! $2 =~ ^[0-9]+$ ]] || [ $2 -lt 1 ] || [ $2 -gt 10 ];
then
  echo "Segundo parametro invalido. Debe ser un numero entre 1 y 10"
  exit 1
fi

file="palabra.txt"

if [ ! -f $file ];
then
  echo "No existe el archivo '$file' en el directorio actual"
  exit 1
fi

word=$(cat $file)

for (( i=0; i<$2; i++ ));
do
  for (( j=0; j<$1; j++ ));
  do
    echo -n $word
  done
  echo
done
