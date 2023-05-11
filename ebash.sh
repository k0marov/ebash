#!/bin/bash 

function transpile {
  echo "$(cat $1)" | 
	  awk -f "function_args.awk" | # support for named function arguments
	  sed -E 's/^#!(.*)/#!\/bin\/bash/' | # changing the shebang 
	  sed -E 's/\$([a-zA-Z_][a-zA-Z_0-9]*)\+\+/\1=\$(( \$\1+1 ))/' | # the increment operator
	  sed -E 's/\$\{\{(.*)\}\}/`bc -q -l -e "pi=a(1)*4;\1"`/' | # math expressions 
	  sed -E 's/\$\?\{\{(.*)\}\}/`bc -q -l -e "pi=a(1)*4;\1"` == "1"/' # math conditionals
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
  eval "$code"
else 
  if [[ -e $output_file ]] 
  then
    echo "The output file $output_file already exists!" 
    read -p "Do you want to overwrite $output_file? (y/n): "
    [[ ! $REPLY =~ ^[Yy](es)?$ ]] && echo "Aborting..." && exit 1
  fi
  echo "$code" > $output_file 
fi

