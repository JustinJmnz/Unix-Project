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
  if [ `sed -n "1p" grades/${classes[$i]}_G.txt` == "SID:LastName:FirstName:" ]; then
	echo "true"
  else
	echo "SID:LastName:FirstName:" >> grades/${classes[$i]}_G.txt 
  fi
  while [ "$j" -lt "$num" ]; do # While less than the amount of students in tmp"$i".txt
	n=`expr $j + 1` # Used to print line numbers
	student=`sed -n "$n"p tmp"$i".txt` # Get the student at line $n
	lName=`echo "$student" | cut -d ':' -f 1` # Cut last name
	fName=`echo "$student" | cut -d ':' -f 2` # Cut first name
	SID=`echo "$student" | cut -d ':' -f 3` # Cut Student ID
	
	originalSID=`sed -n "$n"p lists/${classes[$i]}_StudentList.txt | cut -d ':' -f 3`
	originalF=`sed -n "$n"p lists/${classes[$i]}_StudentList.txt | cut -d ':' -f 2`
	originalL=`sed -n "$n"p lists/${classes[$i]}_StudentList.txt | cut -d ':' -f 1`
		if grep "$originalSID" grades/${classes[$i]}_G.txt ;then # Check if student is already in file
		echo "FILE HAS STUDENT $originalF:$originalL:$originalSID ALREADY"	
	else
		echo "ADDING STUDENT  $originalF:$originalL:$originalSID TO GRADES"
		echo "$SID:$lName:$fName:" >> grades/${classes[$i]}_G.txt
	fi
	j=`expr $j + 1`
	done
done
for i in ${!classes[@]}; do # Loop through array
	rm tmp"$i".txt # Remove file
done
sort -t':' -k1 $file -o $file  # Sort file by field one, store it back
}

createDB
updateDB
clear
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
