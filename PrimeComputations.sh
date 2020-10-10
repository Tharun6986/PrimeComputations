#!/bin/bash
echo "Welcome to Prime Computations code"

function PrimeGenerator(){
count=1
i=2

while [ $count -le $limit ]
do
        flag=0
        for (( j=2; j<=$(($i/2)); j++ ))
        do
                if [ $(($i%$j)) -eq 0 ]
                then
                        flag=1
                        break
                fi
        done
        if [ $flag -eq 0 ]
        then
                array[count]=$i
                ((count++))
        fi
        ((i++))
done
UnitsPlace ${array[@]}
}

function RevNum(){
for (( rev=${#array[@]}; rev>=0; rev-- ))
do

        echo "${array[rev]}"
	((rev--))
done
}

function UnitsPlace( ){
variable=0
for values in ${array[@]}
do
	variable=$(( $values%10 ))

        if [ $variable -eq 1 ]
        then
        	echo $values
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

##First 100 primes having 1 on its units place are
UnitsPlaceHaving1(){
read -p "enter limit: " limit
echo "First 100 primes having units place 1 are: "
PrimeGenerator $((limit))
}
UnitsPlaceHaving1
