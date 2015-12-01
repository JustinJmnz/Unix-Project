getNextClass() {
index=0
for i in "${extraClass[@]}"; do
	if [ "$i" = "Class does not exist yet!" ]; then
		extraClass[$index]="Exists!" # Change class to Exists!
		break; 
	fi
	index=`expr $index + 1` # Increment
done
}

createClass() {
echo "Enter class (ex.. cs101_01):"
read classNum
echo "Enter class title (ex.. Intro to Computers):"
read classTitle
getNextClass # Will get the next available class, $extraClass(X) 
# $index will contain the next available class in array extraClass[x]
newClass="$classNum"_StudentList.txt # Name of file
touch  "lists/"$newClass"" # Create NEW student file for $newClass
echo "$classNum -$classTitle" >> "lists/classList.txt" # Append data to file
showClasses
}

getStudentFile () {
case $input in
	1)
	if [ "${extraClass[0]}" != "Class does not exist yet!" ]; then
        file=`sed -n '1p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected 
    else
        echo ${extraClass[0]}
    fi
	;;
	2)
    if [ "${extraClass[1]}" != "Class does not exist yet!" ]; then
        file=`sed -n '2p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[1]}
    fi
	;;
    3)
	if [ "${extraClass[2]}" != "Class does not exist yet!" ]; then
        file=`sed -n '3p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[2]}
     fi
	;;
	4)
    if [ "${extraClass[3]}" != "Class does not exist yet!" ]; then  
		file=`sed -n '4p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
    	file="lists/"$file"_StudentList.txt" # Display file selected
	else
		echo ${extraClass[3]}
	fi
	;;
	5)
	if [ "${extraClass[4]}" != "Class does not exist yet!" ]; then
        file=`sed -n '5p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[4]}
    fi
	;;
	6)
	if [ "${extraClass[5]}" != "Class does not exist yet!" ]; then
        file=`sed -n '6p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[5]}
    fi
	;;
	7)
	if [ "${extraClass[6]}" != "Class does not exist yet!" ]; then
        file=`sed -n '7p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[6]}
    fi
	;;
	8)
	if [ "${extraClass[7]}" != "Class does not exist yet!" ]; then
        file=`sed -n '8p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[7]}
    fi	
	;;
	9)
	if [ "${extraClass[8]}" != "Class does not exist yet!" ]; then
        file=`sed -n '9p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[8]}
    fi
	;;
	10)
	if [ "${extraClass[9]}" != "Class does not exist yet!" ]; then
        file=`sed -n '10p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo ${extraClass[9]}
    fi
	;;
	[nN])
	createClass
	;;	
	*)
	echo "Teachers can only teach up to 10 classes."
	;;
esac
}

showClasses() {
echo "Choose A Class, or enter (n/N) to create a new class:"
cat -n "lists/classList.txt" # Display all classes in classList.txt
read input
getStudentFile
}

updateArray() {
amount=`wc -l < lists/classList.txt`
index=0
while [ $index -lt $amount ]; do
	extraClass[$index]="Exists!"
	index=`expr $index + 1`
done
while [ $index -le 10 ]; do
	extraClass[$index]="Class does not exist yet!"
	index=`expr $index + 1`
done
}
### For when prof will add a class
extraClass[0]="Exists!"
extraClass[1]="Exists!"
extraClass[2]="Exists!"
extraClass[3]="Class does not exist yet!"
extraClass[4]="Class does not exist yet!"
extraClass[5]="Class does not exist yet!"
extraClass[6]="Class does not exist yet!"
extraClass[7]="Class does not exist yet!"
extraClass[8]="Class does not exist yet!"
extraClass[9]="Class does not exist yet!"
updateArray
file="DNE"
showClasses
export file # Export path to student list to selected class
if [ "$1" == "normal" ]; then 
	echo "What would you like to do."
	echo "1: Add student to class"
	echo "2: Edit student in class"
	echo "3: Remove student"
	read choice
	case $choice in 
		1)
		./addStudent.sh
		;;
		2)
		./searchStudent.sh "edit"
		;;
		3)
		./searchStudent.sh "remove"
		;;
	esac
elif [ "$1" == "Add Grade" ]; then
	./searchStudent.sh "Add Grade"
elif [ "$1" == "Change Grade" ]; then
	./searchStudent.sh "Change Grade"
fi

