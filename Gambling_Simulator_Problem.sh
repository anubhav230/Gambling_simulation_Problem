#!/bin/bash -x

#contants
WIN=1
STAKE=100
BET=1
MAX_PROFIT_PER_DAY=50
MAX_LOSS_PER_DAY=-50

#variables
minAmount=9999
maxAmount=0
saveAmount=100
win=0
lose=0
luckyDay=0
unLuckyDay=0
day=0
perDayWin=0
flage=1
while (( $flage >= 1 ))
do
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
			#perDayWin=$day
		else
			loose[$day]=$wallet
			((lose++))
			#perDayLose=$day
		fi
		saveAmount=$(($saveAmount+$wallet))
		echo "----/  $saveAmount"
		if [ $saveAmount -lt $minAmount ]
		then

			unLuckyDay=$(($day))
			minAmount=$saveAmount
		fi
		if [ $saveAmount -gt $maxAmount ]
		then
			luckyDay=$(($day))
			maxAmount=$saveAmount
		fi

		#echo "$minAmount"
		#echo "$maxAmount"


	done

	echo "days wins ${!wins[@]}--------$((50*$win))"
	echo "days looses ${!loose[@]}-------$((50*$lose))"

	echo Luckiest day $luckyDay amount is $maxAmount
	echo Unluckiest day $unLuckyDay amount is $minAmount

	if (( $saveAmount >= 0 ))
	then
		echo "Total profit amount $saveAmount"
		read -p "Please enter 1 if u want to play again else 0 to exit: " flage
	else
		echo "Total loose amoutn $saveAmount"
		flage=0
	fi
done
