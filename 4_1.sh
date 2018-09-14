if [ ! -f $1 ]
then
  echo "Not a valid file"
fi
basename=$1; fileext=
while [[ $basename = ?*.* &&
         ( ${basename##*.} = [A-Za-z]* || ${basename##*.} = 7z ) ]]; do
  fileext=${basename##*.}.$fileext
  basename=${basename%.*}
done
fileext=${fileext%.}
if [ $fileext == "tar" ] || [ $fileext == "tar.gz" ] || [ $fileext == "tar.xz" ] || [ $fileext == "tar.bz2" ] || [ $fileext == "bz2" ] || [ $fileext == "zip" ] || [ $fileext == "7z" ]
then
  tar -xvf $1
else
  echo "Not a valid extension"
fi
