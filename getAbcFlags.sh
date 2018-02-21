#!/bin/sh

# test for argument number
if [ $# -ne 1 ]; then

  echo "the argument sould be one!";
  exit 1;

fi
# end test for argument number

abcDir=$1
currentDir=$(pwd)
abcFlags=""

cd ${abcDir}

# get abc compile flags
for string in $( make | grep "CFLAGS" ); do 

   if [[ ${string} =~ '-D' ]]; then

     abcFlags+=" ${string}";

   fi

done
# end get abc compile flags

cd ${currentDir}
echo ${abcFlags}
