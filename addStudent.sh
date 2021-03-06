checkDuplicates() {
studentIDs=`awk -F ":" '{print $3}' $file` # Get 3rd field
echo $studentIDs > tmpStudentIDs # Print all field 3s to a file
tr ' ' '\n' < tmpStudentIDs > tmp # Replace spaces with \n to tmp
mv tmp tmpStudentIDs #rename tmp to tmpStudentIDs
studentEmails=`awk -F ":" '{print $4}' $file` # Get 4th field
echo $studentEmails > tmpStudentEmails # Print all field 4s to a file
tr ' ' '\n' < tmpStudentEmails > tmp  # Replace spaces with \n
mv tmp tmpStudentEmails # Rename tmp to tmpStudentEmails
lastID=`sed -n '$p' tmpStudentIDs`
lastEmail=`sed -n '$p' tmpStudentEmails`
occID=`grep -i $lastID tmpStudentIDs | wc -l`
occEmail=`grep -i $lastEmail tmpStudentEmails | wc -l`
if [ $occID -gt 1 ] || [ $occEmail -gt 1 ]; then # If file contains $lastID
	echo `sed -n '$p' tmpStudentIDs`
	echo "ID/Email exists already, add student?"
	echo "Yes: 1"
	echo "No: 2"
	read choice
	if [ $choice -eq 2 ]; then
		sed '$d' < $file > tmp # Delete last line save to tmp
		mv tmp $file # rename tmp to $file
	fi
fi	
}
addStudentFIELDS() {
echo "Enter student last name:"
read lastName
echo "Enter student first name:"
read firstName
echo "Enter student id:"
read studentID
echo "Enter student email:"
read studentEmail
echo "Enter student phone number:"
read studentPhone
echo "$lastName":"$firstName":"$studentID":"$studentEmail":"$studentPhone" >> $file
checkDuplicates
}
addStudentCOLONS() {
read info
echo $info >> $file
checkDuplicates
}
addStudentMULTIPLE() {
echo "How many people would you like to enter?"
read numOfStudents
i=0
echo $numOfStudents
while [ $i -lt $numOfStudents ]
do
	i=`expr $i + 1` # Increment i
	echo "Enter student: $i"
	addStudentCOLONS # Call method $numOfStudents times
done 
}

file=$file # Capture export
#echo $file
if test -e $file ; then
	echo "File Exists"
else 
	echo "File does not exist"
fi
echo "How do you want to enter student data?"
echo "1: Colon"
echo "2: Individual fields"
echo "3: Multiple People"
read input
case $input in
	1)
	echo "Enter data seperated by colons"
	addStudentCOLONS # Call method to enter data by colons
	;;
	2)
	addStudentFIELDS # Call method to enter data individualy
	;;
	3)
	addStudentMULTIPLE # Call method to enter data for multiple people
	;;
esac
rm tmpStudentIDs
rm tmpStudentEmails
sort -t':' -k1 $file -o $file  # Sort file by field one, store it back
