read -p "Enter radius: " r
area=`bc -l -e "pi=a(1)*4;pi*$r^2"`
echo "Area = $area" 
