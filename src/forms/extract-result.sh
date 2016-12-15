echo '' > rslt.lst
ls *.txt | while read file_name
do
	if grep '_[tT][lL]' $file_name > /dev/null || grep '[fF][nN][dD]_[lL][oO][oO][kK][uU][pP]_[vV][lL][aA][uU][eE][sS]' $file_name > /dev/null
	then
		printf "$file_name\n" >> rslt.lst
	fi
done
