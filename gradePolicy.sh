echo "Enter $class grade policy"
echo "Homework:"
read hwP
echo "Exams:"
read examP
echo "Quizzes:"
read quizP
echo "Projects:"
read projP

inColHW=`awk 'BEGIN{ FS=":"} { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' finalGrades/"$class"_FG.txt | grep -n "hT" | cut -d ':' -f 1` # Get col for hT
inColE=`awk 'BEGIN{ FS=":"} { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' finalGrades/"$class"_FG.txt | grep -n "eT" | cut -d ':' -f 1` # Get col for eT
inColQ=`awk 'BEGIN{ FS=":"} { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' finalGrades/"$class"_FG.txt | grep -n "qT" | cut -d ':' -f 1` # Get col for qT
inColP=`awk 'BEGIN{ FS=":"} { for(fn=1;fn<=NF;fn++) {print fn" = "$fn;}; exit 0;}' finalGrades/"$class"_FG.txt | grep -n "pT" | cut -d ':' -f 1` # Get col for pT
echo "Homework total is in column: $inColHW"
cut -d ':' -f $inColHW finalGrades/"$class"_FG.txt
echo "Exam total is in column: $inColE"
cut -d ':' -f $inColE finalGrades/"$class"_FG.txt
echo "Column total is in column: $inColQ"
cut -d ':' -f $inColQ finalGrades/"$class"_FG.txt
echo "Project total is in column: $inColP"
cut -d ':' -f $inColP finalGrades/"$class"_FG.txt
