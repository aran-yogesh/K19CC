count=200
a=$1
if[ count>=`wc -w <$a` ]
then
echo "greater"
else
echo "less"
fi
