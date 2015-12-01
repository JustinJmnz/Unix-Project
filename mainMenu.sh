echo "What do you want to do?"
echo "1: Add/Edit/Remove Student from a class or create a new class"
echo "2: Change/Add/Calculate grades from a class"
read input
case $input in 
	1)
	./getClassDir.sh "normal"
	;;
	2)
	./database.sh
	;;
esac
