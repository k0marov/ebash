# ebash

eBash (Extended Bash) is a Bash preprocessor adding various arithmetic additions and shortcuts.

## Quick Start

1. Download the script and give it execution rights: 
```
chmod +x ./ebash.sh
```

2. Write a Bash script using additional eBash syntax and give it an extension of `.esh`: 

_test.esh_
```
read -p "Please enter the circle radius: " radius 
echo "Area = ${{3.14*$radius^2}}"
$radius++ 
echo "If you increment the radius, the area would be = ${{3.14*$radius^2}}" 
``` 

3. Then execute the script using `ebash.sh`: 
```
./ebash.sh test.esh
```

## Docs

### General 

The script works as a preprocessor that transpiles .esh files to Bash-executable .sh files. 

It also has an option to immediately execute the provided .esh file. 

.esh files support special syntax for complex arithmetic operations using [bc](https://www.gnu.org/software/bc/manual/html_mono/bc.html). 

### Features 

#### Increment operator 
Example: 

_increment.esh_
```
i=1
$i++
echo "i = $i" 
```

Transpiles to:

_increment.sh_
```
i=1
i=$(($i+1))
echo "i = $i" 
```

And outputs `i = 2`

#### Arithmetic operators syntax

Example:

_arithmetic.esh_
```
a=${{ 2.5 * 6 + cos(0) }} # 15 
b=${{ 2^2 }} # 4 
echo "The result is ${{ $a / $b }}" 
```

Transpiles to:

_arithmetic.sh_
```
a=$(bc<<<" 2.5 * 6 + cos(0) ") # 15 
b=$(bc<<<" 2^2 ") # 4 
echo "The result is $(bc<<<" $a / $b ")" 
```

And outputs `The result is 3.75`

## TODO

- [x] increment operator `$i++`
- [x] complex arithmetic expressions `${{5/3 + 3^2 + sin(0)}}`
- [x] complex arithmetic inequalities `$?{{5/3 >= 2}}`
- [x] directly executing the provided .esh file 
- [x] transpiling to a file 
- [x] specifying the output file path 
- [x] validating the output file path
- [ ] add more info to the docs 
- [ ] add support for the PI constant
- [x] validation of the input file argument 
- [ ] support for running with shebang 
- [ ] changing the shebang for the output file
- [ ] checking if the output file already exists
