#!/usr/bin/bash

file="fichero_vacio"
size=1024

if [ "$#" -gt 2 ];
then
  echo "Se reciben mas de 2 parametros"
  exit 1
fi

if [ ! -z "$1" ];
then
  file=$1
fi

if [ ! -z "$2" ];
then
  size=$2
fi

dd if=/dev/zero of="$file" bs=1K count="$size" status=none

echo "Fichero '$file' creado con $size KB de tamanio"
