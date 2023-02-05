odd(){
for i in $@
do
if(( i%2==1 ))
then
sum=$(( sum+i ))
echo $sum
fi
done
}
odd 2 4 45 6 1
