#!/bin/bash -x
WIN=1
STAKE=100
BET=1
MAX_PROFIT_PER_DAY=50
MAX_LOSS_PER_DAY=-50
count=0
totalAmount=0
for (( day=1; day<=20; day++))
do
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
echo $wallet
dayResult[((count++))]=$wallet
totalAmount=$(($totalAmount+($STAKE+$wallet)))
done
echo "result for every day ${dayResult[@]}"
echo "Total amount by end of day $totalAmount"



