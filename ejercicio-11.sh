#!/usr/bin/bash

if [ -z "$1" ];
then
  echo "No se ingreso ningun parametro"
  echo "Uso: $0 fichero1 fichero2"
  exit 1
fi

if [ -z "$2" ];
then
  echo "Solo se ingreso un parametro"
  echo "Uso: $0 fichero1 fichero2"
  exit 1
fi

if [ ! -z "$3" ];
then
  echo "Se ingreso mas de 2 parametros"
  echo "Uso: $0 fichero1 fichero2"
  exit 1
fi

if [ ! -f "$1" ];
then
  echo "El primer fichero no existe o no es un fichero"
  exit 1
fi

if [ ! -f "$2" ];
then
  echo "El segundo fichero no existe o no es un fichero"
  exit 2
fi

sizeFirst=$(stat -c%s "$1")
sizeSecond=$(stat -c%s "$2")

sizeFirstKB=$(echo "scale=2; $sizeFirst / 1024" | bc)
sizeSecondKB=$(echo "scale=2; $sizeSecond / 1024" | bc)

echo "El tamano del archivo '$1' es de $sizeFirstKB KB, y el tamano del archivo '$2' es de $sizeSecondKB KB"
