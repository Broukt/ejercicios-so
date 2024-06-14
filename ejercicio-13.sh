#!/usr/bin/bash

if [ -z "$1" ];
then
  echo "No se entregaron parametros"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [ -z "$2" ];
then
  echo "Solo se ingreso un parametro"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [ -z "$3" ];
then
  echo "Solo se ingreso 2 parametros"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [ ! ${#1} -eq 1 ];
then
  echo "El primer parametro es mas de un caracter"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [[ ! $2 =~ ^[0-9]+$ ]];
then
  echo "El segundo parametro no es un numero"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [ $2 -lt 1 ] || [ $2 -gt 60 ];
then
  echo "El segundo parametro no se encuentra dentro del rango [1-60]"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

if [[ ! $3 =~ ^[0-9]+$ ]] || (( $echo( "$3 < 1" | bc) )) || (( $echo( "$3 > 10" | bc) ));
then
  echo "Tercer parametro invalido"
  echo "Uso: $0 caracter [1-60] [1-10]"
  exit 1
fi

for (( i=0; i<$3; i++ ));
do
  for (( j=0; j<$2; j++ ));
  do
    echo -n $1
  done
  echo
done
