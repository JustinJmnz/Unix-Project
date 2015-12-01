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
createDB
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
