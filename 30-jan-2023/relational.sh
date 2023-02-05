read -p 'enter a: ' a
read -p 'enter b: ' b

if(( $a == $b ))
then
echo a is equal to b
else
echo a is not equal to b
fi

if(( $a != $b ))
then
echo a is not equal to b
else
echo a is equal to b
fi

if(( $a < $b ))
then
echo a is less than b
else
echo a is greater than b
fi

if [ $a -gt $b ]
then
echo a is greater than b
else
echo a is less than b
fi

if [ $a -ge $b ]
then
echo a is greater than or equal to b
else
echo a is not greater than or equal to b
fi


