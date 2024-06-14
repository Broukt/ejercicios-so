#!/usr/bin/bash

for file in *;
do
  if [[ ! "$file" == *" "* ]];
  then
    continue
  fi
  newFileName=$(echo "$file" | tr ' ' '_')
  mv "$file" "$newFileName"
  echo "Se cambiara el nombre del fichero '$file' por '$newFileName'"
done
