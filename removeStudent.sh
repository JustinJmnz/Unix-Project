student=$studentFound
line=$lineNumber
file=$file
echo "Remove $student at line #$line in $file?"
echo "Enter y/n"
read input
if [ "$input" == "y" ] || [ "$input" == "Y" ]; then
	sed ""$line" d" $file > lists/t.txt
	mv lists/t.txt $file
	echo "Student removed"	
fi
