awk ' NR==2,NR==4{ print $1" "$2" "$5 } ' marks.txt
