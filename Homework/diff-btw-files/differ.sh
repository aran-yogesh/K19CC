#write a shell program to print those files of the file which are not common in file1 and file2

echo "enter the first file name you want to check"
read a
echo "enter the second file name you want to check"
read b
diff $a $b
