s_dir=$1
s_ext=$2
if [[ "$s_dir" != /* ]]
then
  path=$(pwd)
  s_dir="$path/$s_dir"
fi
if [ -d "$s_dir" ]
then
  for file_entry in "$1"/*
  do
    if [ ! -d "$file_entry" ]
    then
      basename=$file_entry; extension=
      while [[ $basename = ?*.* &&
               ( ${basename##*.} = [A-Za-z]* || ${basename##*.} = 7z ) ]]; do
        extension=${basename##*.}.$extension
        basename=${basename%.*}
      done
      extension=${extension%.}
      if [[ "$s_ext" != "all" ]]
      then
        found=0
        first=1
        for i in $*
        do
          if [ "$first" -ne 1 ]
          then
            if [[ "$i" = "$extension" ]]
            then
              found=1
            fi
          else
            first=0
          fi
        done
        if [ $found -ne 1 ]
        then
          continue
        fi
      fi
      dest_dir="$s_dir/$extension"
      if [ ! -d "$dest_dir" ]
      then
        mkdir "$dest_dir"
      fi
      cp "$file_entry" "$dest_dir"
      rm "$file_entry"
    fi
  done
else
  echo "Directory does not exist"
fi
