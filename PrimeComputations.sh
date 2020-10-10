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
RevNum ${array[@]}
}

function RevNum(){
for (( rev=${#array[@]}; rev>=0; rev-- ))
do

        echo "${array[rev]}"
done
}

##First 100 primes in Reverse Order

RevOrder(){
read -p "enter limit: " limit
echo "first 100 primes in reverse order:"
PrimeGenerator $((limit))
}
RevOrder



