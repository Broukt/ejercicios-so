#!/usr/bin/bash

file="fichero_vacio"
size=1024
count=1

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

if [ -e "$file" ];
then
  echo "Ya existe un fichero con este nombre"
  count="${file: -1}"
  newName="$file"
  if [[ ! "$count" =~ [0-9] ]];
  then
    count=1
    newName="${file}${count}"
  fi
  length=${#newName}

  while [ -e "$newName" ];
  do
    count=$((count + 1))
    if [ $count -gt 9 ];
    then
      echo "No se puede crear el archivo. Ya existen archivos con sufijos del 1 al 9"
      exit 1
    fi
    newName="${newName:0:$(($length - 1))}$count"
  done

  file="$newName"
  echo "Se creara el archivo con el nombre:  '$file'"
fi

dd if=/dev/zero of="$file" bs=1K count="$size" status=none

echo "Fichero '$file' creado con $size KB de tamanio"
