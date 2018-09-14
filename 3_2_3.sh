awk ' NR>=2{ printf "%s %d\n",$1,($3+$4+$5) } ' marks.txt
