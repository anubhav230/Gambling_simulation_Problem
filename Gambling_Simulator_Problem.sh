#!/bin/bash -x
WIN=1
STAKE=100
BET=1
MAX_PROFIT_PER_DAY=50
MAX_LOSS_PER_DAY=-50
count=0
totalAmount=100
for (( day=1; day<=10; day++))
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
totalAmount=$(($totalAmount+$wallet))
done
echo "result for every day ${dayResult[@]}"
if (( $totalAmount >= 0 ))
then
	echo "Total profit $totalAmount"
else
	echo "Total loose amoutn $totalAmount"
fi

