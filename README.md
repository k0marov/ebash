# ebash

eBash (Extended Bash) is a Bash preprocessor adding various arithmetic additions and shortcuts.

## Docs

### General 

The script works as a preprocessor that transpiles .esh files to Bash-executable .sh files. 

It also has an option to immediately execute the provided .esh file. 

.esh files support special syntax for complex arithmetic operations using [bc](https://www.gnu.org/software/bc/manual/html_mono/bc.html). 

### Features 

#### Increment operator 
_increment.esh_
Example: 
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

- [ ] increment operator `$i++`
- [ ] complex arithmetic operators syntax `${{ 3^2 / 5 * sin(3.14) }}`
- [ ] complex arithmetic inequalities `$?{{5/3 >= 2}}`
- [ ] directly executing the provided .esh file 
- [ ] transpiling to a file 
- [ ] specifying the output file path 
- [ ] add more info to the docs 
