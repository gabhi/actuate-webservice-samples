#!/bin/sh

if [ $# -gt 1 ]; then
	HOSTNAME=$1
	PORT=$2
else
	HOSTNAME=`hostname`
	PORT=8000
fi

ant compile -DhostName=$HOSTNAME -Dport=$PORT

