#!/bin/bash 

function transpile {
  echo "$(cat $1)" \
	  | sed -E 's/\$([a-zA-Z_][a-zA-Z_0-9]*)\+\+/\1=\$(( \$\1+1 ))/' # increment operator
}

input_file=$1

if [[ -z $input_file ]] 
then
  echo "You should provide the input file as the first argument!"
  exit 1 
elif [[ ! -f $input_file ]] 
then 
  echo "The input file $input_file does not exist!"
  exit 1
fi

code=`transpile $input_file`

output_file=$2 

if [[ -z $output_file ]] 
then
  echo "$code" | bash 
else 
  echo "$code" > $output_file 
fi

