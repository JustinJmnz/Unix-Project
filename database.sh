createDB() {
	numOfClasses=`wc -l lists/classList.txt | cut -d ' ' -f 1`
	classNames=`cut -d ' ' -f 1 lists/classList.txt`
	echo "$classNames" > tmp.txt
	i=1
	while [ $i -le $numOfClasses ]; do 
		classes[`expr $i - 1`]=`sed -n "$i"p tmp.txt`
		cd grades/
		touch "${classes[`expr $i - 1`]}_G.txt"
		cd ..
		i=`expr $i + 1`
	done
	rm tmp.txt
}
updateDB() {
for i in ${!classes[@]}; do # Loop through array
  cat lists/${classes[$i]}_StudentList.txt | cut -d ':' -f 1-3 > tmp"$i".txt
  num=`wc -l tmp"$i".txt | cut -d ' ' -f 1` # Get number of students
  j=0
  while [ "$j" -lt "$num" ]; do # While less than the amount of students in tmp"$i".txt
	n=`expr $j + 1` # Used to print line numbers
	student=`sed -n "$n"p tmp"$i".txt` # Get the student at line $n
	lName=`echo "$student" | cut -d ':' -f 1` # Cut last name
	fName=`echo "$student" | cut -d ':' -f 2` # Cut first name
	SID=`echo "$student" | cut -d ':' -f 3` # Cut Student ID
	p=1
	#while [ "$p" -le "$num" ];do
		#originalLast=`sed -n "$j"p "lists/${classes[$i]}_StudentList.txt" | cut -d ':' -f 1`
		#originalFirst=`sed -n "$j"p "lists/${classes[$i]}_StudentList.txt" | cut -d ':' -f 2`
		originalSID=`sed -n "$p"p lists/${classes[$i]}_StudentList.txt | cut -d ':' -f 3`
		if grep -q "$originalSID" tmp"$i".txt;then # Check if file contains string already
			echo "FILE CONTAINS ME ALREADY"	
		else
			echo "ELSE"
			echo "$SID:$lName:$fName" >> grades/${classes[$i]}_G.txt
		fi
		#p=`expr $p + 1`
	#done
    j=`expr $j + 1`
	p=`expr $p + 1`
  done
done
for i in ${!classes[@]}; do # Loop through array
	rm tmp"$i".txt # Remove file
done
}

createDB
updateDB
echo "What do you want to do?"
echo "1: Add Grade"
echo "2: Change Grade"
read input
case $input in
	1)
	./getClassDir.sh "Add Grade"
	;;
	2)
	./getClassDir.sh "Change Grade"
	;;
	*)
	echo "Not a choice"
	;;
esac
