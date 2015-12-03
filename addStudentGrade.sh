clear
student=$studentFound
fName=`echo $student | cut -d ':' -f 2`
lName=`echo $student | cut -d ':' -f 1`
file=$file
class=`echo $file | cut -d '/' -f 2 | cut -d '_' -f 1,2`
lineNumber=`grep -n "$fName" grades/"$class"_G.txt | awk -F: '{print $1}'`
echo "What is the title of the grade (ex.. hw01,q01,p01,e01)?"
read title
echo "Enter the grade of $title for $fName $lname"
read grade
echo "You are going to add the grade of $grade to $fName $lName for "$title", is this correct? (y/n)"
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
	line=`wc -l grades/"$class"_G.txt | cut -d ' ' -f 1` # Get number of lines 
	i=0
	j=1
	while [ $i -lt $line ]; do # Put all rows in rows[]
		rows[$i]=`sed -n "$j"p grades/"$class"_G.txt`
		i=`expr $i + 1`
		j=`expr $j + 1`
	done
	echo DONEEEEEEEEEEEEEE
	value=$title
	count=1
	echo $lineNumber
	for i in ${!rows[@]}; do
		echo ${rows[$i]} > tmp.txt
		if [ $count -eq 1 ]; then
			value=$title':'
		elif [ $count -eq $lineNumber ]; then
			value=$grade':'
		else
			value=':'
		fi
		rows[$i]=`sed "s/$/$value/" tmp.txt`
		echo ${rows[$i]}
		count=`expr $count + 1`
	done	
fi
rm tmp.txt
