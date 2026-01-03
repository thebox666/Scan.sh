#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
   
    echo -e "\n\n${redColour}[!] Saliendo...${endColour}"
    
  exit 1
}

#Variables
ip=$(hostname -I | awk '{print $1}' | cut -d '.' -f1-3)

if [ "$(id -u)" -eq "0" ]; then

echo -e "${yellowColour}Ejecutando script...${endColour}"

     sleep 1.5
   clear
     

for i in {1..255}; do

timeout 0.5 bash -c "ping -c 1 $ip.$i" >/dev/null 2>&1


if [ $? -eq 0 ]; then

echo -e "${greenColour}El host $ip.$i esta activo${endColour}"

    timeout 0.5 bash -c "nmap -p- --open --min-rate 5000 -n -sS -vvv $ip.$i | grep 'open'" 2>/dev/null

fi

done
else
 echo -e "${redColour}Necesitas ser root para ejecutar el script${endColour}"

fi


