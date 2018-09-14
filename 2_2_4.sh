sed -nr -e 's/[[:punct:]]/\*/g' -e 's/[0-9]/?/pg' address-book.csv
