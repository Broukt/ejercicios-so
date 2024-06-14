#!/usr/bin/bash

if [ "$#" -eq 0 ];
then
  echo "No se ingreso ninguna palabra"
  exit 1
fi

if [ "$#" -gt 1 ];
then
  echo "Se ingreso mas de 1 parametro"
  exit 1
fi

word=$1

modifiedWord=$(echo "$word" | tr 'aeiou' '12345')

echo $modifiedWord
