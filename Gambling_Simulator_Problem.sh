#!/bin/bash -x
WIN=1
STAKE=100
BET=1
betCheck=$((RANDOM%2))

if [ $WIN -eq $betCheck ]
then
	echo "Winner won 1$"
else
	echo "Lost 1$ "
fi

