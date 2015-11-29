changeFirst() {
lastName=`cut -f 1 -d ':' temp.txt` # Cut last name
firstName=`cut -f 2 -d ':' temp.txt` # Cut first name
SID=`cut -f 3 -d ':' temp.txt` # Cut SID
email=`cut -f 4 -d ':' temp.txt` # Cut email
phone=`cut -f 5 -d ':' temp.txt` # Cut phone number
oldLine="$lastName:$firstName:$SID:$email:$phone"
echo "Enter new first name:"
read Fname
echo "Keep changes? y/n"
newLine="$lastName:$Fname:$SID:$email:$phone"
echo $newLine
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
	sed -i "$lineN c\ $newLine" $file # Change line # $lineN to $newLine
	sed 's/ //g' $file > lists/t.txt # Delete white space
	mv lists/t.txt $file # Write over $file with new values
fi
cat $file
}

changeLast() {
lastName=`cut -f 1 -d ':' temp.txt` # Cut last name
firstName=`cut -f 2 -d ':' temp.txt` # Cut first name
SID=`cut -f 3 -d ':' temp.txt` # Cut SID
email=`cut -f 4 -d ':' temp.txt` # Cut email
phone=`cut -f 5 -d ':' temp.txt` # Cut phone number
echo "Enter new last name"
read Lname
newLine="$Lname:$firstName:$SID:$email:$phone"
echo "Keep changes? y/n"
echo $newLine
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
	sed -i "$lineN c\ $newLine" $file
	sed 's/ //g' $file > lists/t.txt
	mv lists/t.txt $file
fi
cat $file
}

changeID() {
lastName=`cut -f 1 -d ':' temp.txt`
firstName=`cut -f 2 -d ':' temp.txt`
SID=`cut -f 3 -d ':' temp.txt`
email=`cut -f 4 -d ':' temp.txt`
phone=`cut -f 5 -d ':' temp.txt`
echo "Enter new student ID"
read newSID
newLine="$lastName:$firstName:$newSID:$email:$phone"
echo "Keep changes? y/n"
echo $newLine
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ];then
	sed -i "$lineN c\ $newLine" $file
	sed 's/ //g' $file > lists/t.txt
	mv lists/t.txt $file
fi
cat $file
}
changeEmail() {
lastName=`cut -f 1 -d ':' temp.txt`
firstName=`cut -f 2 -d ':' temp.txt`
SID=`cut -f 3 -d ':' temp.txt`
email=`cut -f 4 -d ':' temp.txt`
phone=`cut -f 5 -d ':' temp.txt`
echo "Enter new email"
read newEmail
newLine="$lastName:$firstName:$SID:$newEmail:$phone"
echo "Keep changes? y/n"
echo $newLine
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ];then
    sed -i "$lineN c\ $newLine" $file
    sed 's/ //g' $file > lists/t.txt
    mv lists/t.txt $file
fi
cat $file
}

changePhone() {
lastName=`cut -f 1 -d ':' temp.txt`
firstName=`cut -f 2 -d ':' temp.txt`
SID=`cut -f 3 -d ':' temp.txt`
email=`cut -f 4 -d ':' temp.txt`
phone=`cut -f 5 -d ':' temp.txt`
echo "Enter new phone number"
read newPhone
newLine="$lastName:$firstName:$SID:$email:$newPhone"
echo "Keep changes? y/n"
echo $newLine
read choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ];then
    sed -i "$lineN c\ $newLine" $file
    sed 's/ //g' $file > lists/t.txt
    mv lists/t.txt $file
fi
cat $file
}

student=$studentFound
file=$file
lineN=$lineNumber
echo $studentFound > temp.txt
echo "What do you want to edit?"
echo "1: First Name"
echo "2: Last Name"
echo "3: Student ID"
echo "4: Email"
echo "5: Phone Number"
read input
case $input in
	1)
	changeFirst
	;;
	2)
	changeLast
	;;
	3)
	changeID
	;;
	4)
	changeEmail
	;;
	5)
	changePhone
	;;
esac
rm temp.txt
