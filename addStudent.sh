checkDuplicates() {
studentIDs=`awk -F ":" '{print $3}' $file`
studentEmails=`awk -F ":" '{print $4}' $file`
echo $studentIDs
echo $studentEmails
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
echo "Enter data seperated by colons"
read info
echo $info >> $file
checkDuplicates
}

file=$1 # Capture export
if test -e $file ; then
	echo "File Exists"
else 
	echo "File does not exist"
fi
echo "How do you want to enter student data?"
echo "1: Colon"
echo "2: Individual fields"
read input
case $input in
	1)
	addStudentCOLONS # Call method to enter data by colons
	;;
	2)
	addStudentFIELDS # Call method to enter data individualy
	;;
esac
sort -t':' -k1 $file -o $file  # Sort file by field one, store it back
