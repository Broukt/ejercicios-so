#!/usr/bin/bash

echo "$(hostname -I | awk '{print $1}')"
echo "$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1)"
#Presente en sistemas antiguos, puede no funcionar
echo "$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | '{print $2}')"
