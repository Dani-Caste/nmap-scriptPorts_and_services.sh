#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Inicializa la variable ip
ip=""

# Comprueba si se proporcionó un argumento
if [ $# -eq 0 ]; then
    echo "Por favor, proporciona el nombre del archivo como argumento."
    exit 1
fi

# Lee el archivo de salida línea por línea
while IFS= read -r line
do
  # Si la línea comienza con "Nmap scan report for", extrae la dirección IP
  if [[ $line == "Nmap scan report for"* ]]; then
    ip=$(echo $line | awk '{print $5}')
    echo -e ${blueColour}"\n\n\nDirección IP: $ip${endColour}" >> ports_and_services.txt
  fi

  # Si la línea contiene "open", imprime el puerto y el servicio
  if [[ $line == *"/"*"open"* ]]; then
    puerto=$(echo $line | awk '{gsub("/tcp",""); gsub("|",""); print $1}')
    servicio=$(echo $line | awk '{print $3}')
    if [[ $puerto != "|"* ]]; then
        echo -e "$puerto\t$servicio" >> ports_and_services.txt
    fi
  fi

done < "$1"