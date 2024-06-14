#!/usr/bin/bash

read -p "Ingresa tu nombre: " name

nameWithoutSpaces=$(echo -n "$name" | tr -d ' ')

lettersAmount=${#nameWithoutSpaces}

if [ $lettersAmount -eq 0 ];
then
  echo "No se ingreso ningun nombre"
  exit 1
fi

echo "Tu nombre tiene $lettersAmount letras"
