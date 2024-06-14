#!/usr/bin/bash

# Obtener la lista de usuarios reales (con directorios en /home)
usuarios=$(ls /home)

# Contar el número de usuarios reales
num_usuarios=$(echo "$usuarios" | wc -l)

# Mostrar el número de usuarios reales
echo "El número de usuarios reales en el sistema es: $num_usuarios"

# Mostrar la lista de usuarios reales
echo "Lista de usuarios:"
echo "$usuarios"

# Pedir al usuario que elija un nombre de usuario de la lista
read -p "Elija un nombre de usuario de la lista para hacer una copia de seguridad: " usuario_elegido

# Verificar que el usuario elegido está en la lista
if ! echo "$usuarios" | grep -q "^$usuario_elegido$"; then
  echo "Error: El usuario elegido no está en la lista."
  exit 1
fi

# Crear el directorio de copia de seguridad si no existe
directorio_backup="/home/copiaseguridad"
if [ ! -d "$directorio_backup" ]; then
  mkdir -p "$directorio_backup"
fi

# Obtener la fecha actual en formato YYYYMMDD
fecha=$(date +"%Y%m%d")

# Crear el nombre del directorio de copia de seguridad
directorio_usuario_backup="$directorio_backup/${usuario_elegido}_$fecha"

# Realizar la copia de seguridad
cp -r "/home/$usuario_elegido" "$directorio_usuario_backup"

# Confirmación de la copia de seguridad
echo "Copia de seguridad de /home/$usuario_elegido realizada en $directorio_usuario_backup"
