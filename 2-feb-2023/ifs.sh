person=A:B:C:D:E
pre_ifs=$IFS
IFS=":"
for per in $persons
do
echo the names are $pre_ifs
done
