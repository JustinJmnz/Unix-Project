searchFirst() {
echo "Enter first name"
read firstName
lineNumber=`grep -n "$firstName" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	flag=1
	echo "Couldnt find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file` 
fi
}
searchLast() {
echo "Enter last name"
read lastName
lineNumber=`grep -n "$lastName" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	flag=1
	echo "Couldnt find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file`
fi
}
searchID() {
echo "Enter student ID"
read studentID
lineNumber=`grep -n "$studentID" $file | awk -F: '{print $1}'`
if [ -z $lineNumber ]; then
	flag=1
	echo "Couldnt find student"
else
	studentFound=`sed -n ""$lineNumber"p" $file`
fi
}
studentFound="Not found"
flag=0
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
if [ "$1" == "edit" ] && [ $flag -eq 0 ]; then
	./editStudent.sh
elif [ "$1" == "remove" ] && [ $flag -eq 0 ]; then
	./removeStudent.sh
elif [ "$1" == "Add Grade" ]; then
	./addStudentGrade.sh
elif [ "$1" == "Change Grade" ]; then
	./changeStudentGrade.sh
else
	echo "Error, searchStudent.sh"
fi
