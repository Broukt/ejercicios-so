#!/usr/bin/bash

hour=$(date +"%H")

morning=12
afternoon=20
night=4

if [ $hour -lt $morning -a $hour -ge $night ];
then
  echo "Buenos dias"
elif [ $hour -lt $afternoon -a $hour -ge $morning ];
then
  echo "Buenas tardes"
else
  echo "Buenas noches"
fi
