echo "What do you want to do?"
echo "1: Add/Edit Student from a class or create a new class"
echo "2: Add grades from a class"
echo "3: Calculate grades"
read input
case $input in 
	1)
	./getClassDir.sh "normal"
	;;
	2)
	./database.sh
	;;
	3)
	./getClassDir.sh "Calc Grades"
	;;
	*)
	echo "Invalid input"
	exit 1
	;;
esac
