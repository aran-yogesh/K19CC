avg(){
n_arg=$#
echo $n_arg
sum=0
for x in "$@"
do
sum=$((sum + x))
done
echo "sum is" $sum
avg=$((sum/n_arg))
return $avg
}
avg 30 40 50 60 80
echo "last returned value:" "$?"
