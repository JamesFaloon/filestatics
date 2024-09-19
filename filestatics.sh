#!/bin/bash


# Setting Variables needed for strings and egrep
output1=""
output2=""

# if there are no parameters exit with a 1
if [ $# -eq 0 ]; then
      echo "you must enter a path"
      echo "Usage: $0 pathname"
      exit 1
fi



# if there are more then one parameters exit with a 3
if [ $# -gt 1 ]; then
      echo "you must enter a path"
      echo "Usage: $0 pathname"
      exit 3
fi


# test if the file exists
ls -ld $1 >/dev/null 2>&1

# if there are errors say the path is not found and exit with a 2
if [ $? -gt 0 ]; then
        echo "$1 not found!"
        exit 2
fi

#loop though each type of file
for files in - b c d l p s; do
        command=$(ls -Rl $1 2> /dev/null | sed '/^$/d' | sed '/^total/d' | sed '/^\//d' | egrep "^$files" | wc -l )
        output1="$output1 $command\t"
done;



echo -e "here are the file Statistics for "$1
echo "Ordinary Block Character Directory Link Pipe"
echo "Socket"
