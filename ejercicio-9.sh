#!/usr/bin/bash

read -p "Ingrese el numero de alumnos de la clase de ISO: " amount

if [[ ! $amount =~ ^[0-9]+$ ]];
then
  echo "Ingrese un valor valido"
  exit 1
fi

if [ $amount -eq 0 ];
then
  echo "No hay alumnos en la asignatura"
  exit 1
fi

failed=0
approved=0
total=0

for i in $(seq 1 $amount);
do
  mark=""
  while true;
  do
    read -p "Ingrese la nota del alumno '$i': " mark
    if [[ $mark =~ ^(7(\.0+)?|[1-6](\.[0-9]+)?)$ ]];
      then
        break
    fi
    echo "Ingrese un valor valido"
  done
  if [ $mark -lt 4 ];
  then
    ((failed++))
  else
    ((approved++))
  total=$(echo "$total + $mark" | bc)
  fi
done

average=$(echo "scale=2; $total / $amount" | bc)

echo "El numero total de suspensos fue: $failed"
echo "El numero total de aprobados fue: $approved"
echo "El promedio del curso fue: $average"
