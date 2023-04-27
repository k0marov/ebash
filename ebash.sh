#!/bin/bash 

function transpile {
  echo $(cat $1) \
	  | sed -E 's/\$(.\w)\+\+/\1=\$(( \$\1+1 ))/' # increment operator
}

echo $(transpile $1) | bash 
