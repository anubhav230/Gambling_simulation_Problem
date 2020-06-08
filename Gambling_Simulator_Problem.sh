#!/bin/bash -x
WIN=1
STAKE=100
BET=1
MAX_PROFIT_PER_DAY=50
MAX_LOSS_PER_DAY=-50
wallet=0
while [[ $wallet -lt $MAX_PROFIT_PER_DAY && $wallet -gt $MAX_LOSS_PER_DAY ]]
do
	betCheck=$((RANDOM%2))
	if [ $WIN -eq $betCheck ]
	then
		wallet=$(($wallet+$BET))
	else
		wallet=$(($wallet-$BET))
	fi
done

echo "$wallet"
echo "wallet amout =$(($STAKE+$wallet))"



