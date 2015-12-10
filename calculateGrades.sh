totalClasses=`wc -l lists/classList.txt | cut -d ' ' -f 1`
class=`echo $file | cut -d '/' -f 2 | cut -d '_' -f 1,2`
cp grades/"$class"_G.txt finalGrades/"$class"_FG.txt 
awk -f script.awk finalGrades/"$class"_FG.txt > tmp.txt # Call awk script to calculate final grades
mv tmp.txt finalGrades/"$class"_FG.txt 
export class
./gradePolicy.sh
