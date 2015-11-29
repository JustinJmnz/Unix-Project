searchFirst() {
echo "Enter first name"
read firstName
lineNumber=`grep -n "$firstName" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	echo "Couldn't find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file` 
fi
}
searchLast() {
echo "Enter last name"
read lastName
lineNumber=`grep -n "$lastName" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	echo "Couldn't find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file`
fi
}
searchID() {
echo "Enter student ID"
read studentID
lineNumber=`grep -n "$studentID" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	echo "Couldn't find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file`
fi
}
studentFound="Not found"
echo "Search for student by:"
echo "1: First Name"
echo "2: Last Name"
echo "3: Student ID"
read choice
case $choice in
	1)
	searchFirst
	;;
	2)
	searchLast
	;;
	3)
	searchID
	;;
	*)
	echo "Choice a number 1-3"
	;;
esac
export studentFound
#echo $studentFound
export lineNumber
if [ $1 == "edit" ]; then
	./editStudent.sh
fi
