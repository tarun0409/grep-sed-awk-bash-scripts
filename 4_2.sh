password=$1
l=${#password};
if [ $l -lt 8 ]
then
  echo "Weak"
else
  echo "$password" | grep -q '[0-9]'
  if [ $? = 0 ]
  then
    echo "$password" | grep -q '[-@\#$%&*+=]'
    #
    if [ $? = 0 ]
    then
      echo "Strong"
    else
      echo "Weak"
    fi
  else
    echo "Weak"
  fi
fi
