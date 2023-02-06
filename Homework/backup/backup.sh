#write a shell program to take backup of files from file1 to file2

echo "enter a new directory name"
read a
echo "enter the directory which you want to take backup"
read b
mkdir $a
cp -r /home/aran/devops/Homework/$b /home/aran/devops/Homework/$a

