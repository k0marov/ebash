#!/bin/bash 

function transpile {
  echo "$(cat $1)" \
	  | sed -E 's/\$([a-zA-Z_][a-zA-Z_0-9]*)\+\+/\1=\$(( \$\1+1 ))/' # increment operator
}

input_file=$1

if [[ -z $input_file ]] 
then
  echo "You should provide the input file as the first argument!"
elif [[ ! -f $input_file ]] 
then 
  echo "The input file $input_file does not exist!"
  exit 1
fi

echo "$(transpile $input_file)" | bash 
