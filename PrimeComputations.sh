#!/bin/bash
echo "Welcome to Prime Computations code"

function PrimeGenerator(){
count=1
i=2

for (( i=2; i<=$(($1+1)); i++ ))
do
flag=0
	for (( j=2; j<$i; j++ ))
	do
		if [ $(($i%$j)) -eq 0 ]
		then
			flag=1
		fi
	done

if [ $flag -eq 0 ]
then
	array[$count]=$i
	count=$(($count+1))

fi

done
PrimePalindrome ${array[@]}
}

function RevNum(){
for (( rev=${#array[@]}; rev>=0; rev-- ))
do

        echo "${array[rev]}"
	((rev--))
done
}

function PrimePalindrome(){
for (( i=10; i<${#array[@]}; i++ ))
do
number=${array[$i]}
reversenumber=0

while [ $number -ne 0 ]
do
        remainder=$(( $number%10 ))
        reversenumber=$(( ($reversenumber*10)+$remainder ))
        number=$(( $number/10 ))
done

if [ $reversenumber -eq ${array[i]} ]
then
	echo "palindrome number:" $reversenumber
	palindrome[$i]=$reversenumber
fi
done
}


##First 100 primes in Reverse Order

RevOrder(){
read -p "enter limit: " limit
echo "first 100 primes in reverse order:"
PrimeGenerator $((limit))
}

##First 50 Alternate Primes in Reverse order are
AlternatePrimes(){
read -p "enter limit: " limit
echo "first 50 alternate primes in Reverse Order are: "
PrimeGenerator $((limit))
}

##palindromic prime numbers between 1 to 200
PalindromicPrimes(){
read -p "enter limit: " limit
PrimeGenerator $((limit))
}
PalindromicPrimes
