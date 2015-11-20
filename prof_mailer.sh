getStudentFile () {
case $input in
	1)
	if [ "$extraClass1" != "Class does not exist yet!" ]; then
        file=`sed -n '1p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected 
    else
        echo $extraClass1
    fi
	;;
	2)
    if [ "$extraClass2" != "Class does not exist yet!" ]; then
        file=`sed -n '2p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass2
    fi
	;;
    3)
	if [ "$extraClass3" != "Class does not exist yet!" ]; then
        file=`sed -n '3p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass3
     fi
	;;
	4)
    if [ "$extraClass4" != "Class does not exist yet!" ]; then  
		file=`sed -n '4p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
    	file="lists/"$file"_StudentList.txt" # Display file selected
	else
		echo $extraClass4
	fi
	;;
	5)
	if [ "$extraClass5" != "Class does not exist yet!" ]; then
        file=`sed -n '5p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass5
    fi
	;;
	6)
	if [ "$extraClass6" != "Class does not exist yet!" ]; then
        file=`sed -n '6p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1i
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass6
    fi
	;;
	7)
	if [ "$extraClass7" != "Class does not exist yet!" ]; then
        file=`sed -n '7p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass7
    fi
	;;
	8)
	if [ "$extraClass8" != "Class does not exist yet!" ]; then
        file=`sed -n '8p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass8
    fi	
	;;
	9)
	if [ "$extraClass9" != "Class does not exist yet!" ]; then
        file=`sed -n '9p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass9
    fi
	;;
	10)
	if [ "$extraClass10" != "Class does not exist yet!" ]; then
        file=`sed -n '10p' "lists/classList.txt" | cut -d ' ' -f1` # Field 1
        file="lists/"$file"_StudentList.txt" # Display file selected
    else
        echo $extraClass10
    fi
	;;
	*)
	echo "Teachers can only teach up to 10 classes."
	;;
esac
}
echo "Choose A Class:"
cat -n "lists/classList.txt" # Display all classes in classList.txt
read input # Waiting for input
### For when prof will add a class
extraClass1="Exists!";extraClass2="Exists!";extraClass3="Exists!";extraClass4="Class does not exist yet!";extraClass5="Class does not exist yet!";extraClass6="Class does not exist yet!";extraClass7="Class does not exist yet!";extraClass8="Class does not exist yet!";extraClass9="Class does not exist yet!";extraClass10="Class does not exist yet!"
getStudentFile 
echo $file

