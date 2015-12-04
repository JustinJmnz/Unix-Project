addNewField(){
line=`wc -l grades/"$class"_G.txt | cut -d ' ' -f 1` # Num of lines in $Class
i=0
j=1
while [ $i -lt $line ]; do # Put all rows in rows[]
	rows[$i]=`sed -n "$j"p grades/"$class"_G.txt`
    i=`expr $i + 1`
    j=`expr $j + 1`
done
value=$title 
count=1
for i in ${!rows[@]}; do # Go through all rows
    echo ${rows[$i]} > tmp.txt # Put each row in a file
    if [ $count -eq 1 ]; then # First line
        value=$title':'
    elif [ $count -eq $lineNumber ]; then # Grade to be added line
        value=$grade':'
    else
        value=':' # Every other line
    fi
    rows[$i]=`sed "s/$/$value/" tmp.txt` # Append to end of row
    count=`expr $count + 1`
done
for i in ${!rows[@]}; do # Displaying rows[]
	echo ${rows[$i]} >> foo.txt
done
mv foo.txt grades/"$class"_G.txt
}

insertGrade() { # $inCol=column to insert to
line=`wc -l grades/"$class"_G.txt | cut -d ' ' -f 1`
i=0
j=1
while [ $i -lt $line ]; do # Put all rows in rows[]
    rows[$i]=`sed -n "$j"p grades/"$class"_G.txt`
    i=`expr $i + 1`
    j=`expr $j + 1`
done
count=1
for i in ${!rows[@]}; do
	echo ${rows[$i]} > tmp.txt # Put row into file
	if [ $count -eq 1 ]; then
		value=$title':'
#		rows[$i]=`sed "s/$/$value/" tmp.txt`
		count=`expr $count + 1`
		continue
	elif [ $count -eq $lineNumber ]; then
		value=$grade
		rows[$i]=`sed -n '1p' tmp.txt | awk -F ':' -vv="$value" -vc="$inCol" '{$c=v}1' | sed 's/ /:/g'`
		count=`expr $count + 1`
		continue
	else
		value=':'
#		rows[$i]=`sed "s/$/$value/" tmp.txt`
		count=`expr $count + 1`
		continue
	fi	
done
for i in ${!rows[@]}; do
	echo ${rows[$i]} >> foo.txt
done
mv foo.txt grades/"$class"_G.txt
}

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
	awk -F ':' "{print NF}" grades/"$class"_G.txt > foo.txt
	numCol=`sed -n '1p' foo.txt` # Get the total number of columns 
	rm foo.txt
	occur=`awk 'BEGIN{ FS=":" } { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' grades/"$class"_G.txt | grep -c "$title"` # Checking to see if $title is already in file
	inCol=`awk 'BEGIN{ FS=":"} { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' grades/"$class"_G.txt | grep -n "$title" | cut -d ':' -f 1` # Get the colunm that $value occurs in 
	if [ "$occur" -eq 1 ]; then
		insertGrade
	else
		addNewField
	fi
fi
rm tmp.txt
