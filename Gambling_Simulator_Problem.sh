#!/bin/bash -x
WIN=1
STAKE=100
BET=1
MAX_PROFIT_PER_DAY=50
MAX_LOSS_PER_DAY=-50
saveAmount=0
win=0
lose=0
for (( day=1; day<=30; day++))
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

if [ $wallet -eq 50 ]
then
	wins[$day]=$wallet
	((win++))
else
	loose[$day]=$wallet
	((lose++))
fi
saveAmount=$(($totalAmount+$wallet))
done
echo "days wins ${!wins[@]}--------$((50*$win))"
echo "days looses ${!loose[@]}-------$((50*$lose))"
echo "Total amount by end of day $saveAmount"



