copyFiles() { # Copy files from grades/ to finalGrades/
totalClasses=`wc -l lists/classList.txt | cut -d ' ' -f 1`
index=1
while [ $index -le $totalClasses ]; do
	class=`sed -n "$index"p lists/classList.txt | cut -d ' ' -f 1`
	cp grades/"$class"_G.txt finalGrades/"$class"_FG.txt 
	index=`expr $index + 1`
done
}

copyFiles
