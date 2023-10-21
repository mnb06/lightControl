#!/bin/bash
state=$(echo '{"method":"getPilot","params":{}}' | socat - UDP-DATAGRAM:255.255.255.255:38899,broadcast | grep true)

if [ -z "$state" ]
then
	printf '{"id":1,"method":"setPilot","params":{"r":35,"g":12,"b":68,"dimming":25}}' | timeout 5 nc -u 192.168.1.2 38899
else
	printf '{"id":1,"method":"setState","params":{"state":false}}' | timeout 5 nc -u 192.168.1.2 38899
fi

