awk ' {if ( $2 == "M" ) print } ' marks.txt > males.txt
awk ' {if ( $2 == "F" ) print } ' marks.txt > females.txt
