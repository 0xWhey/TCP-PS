#!/bin/bash

tput clear
cat << "EOF"
                 Simple bash TCP Port Scanner              
EOF

read -p "IP address to scan -> " ipAdress

if [[ $ipAdress =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]
 then
  echo 
  echo "Start scanning ports of $ipAdress" 
  echo 
  ping -c1 $ipAdress >/dev/null 2>&1
 else 
  echo 
  echo "The IP address is not a valid IPV4 address."
  echo 
  exit 1
fi

for port in {1..65535}; do
2>/dev/null echo > /dev/tcp/$ipAdress/$port

 if [ $? = 0 ]
  then echo "Port $port is open!"


 else echo "Nothing was found."
      echo
      exit 1
 fi
done