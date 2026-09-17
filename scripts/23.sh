#echo "condition"
# read x
# read y
# read z
# echo "------------------------------------------"
# echo $x
# echo $y
# echo $z
# echo "-------------------------------------------"

# if [ $x == $y -a $y == $z -a $z == $x ]; then
#     echo EQUILATERAL
# elif [ $x == $y -o $y == $z -o $z == $x ]; then
#     echo ISOSCELES
# else
#     echo SCLANE
# fi

# echo "for loop 1"

# for i in {1..5}; do
#     echo $i
# done

# echo "for loop 2"
# for x in orange mango lemone; do
#     echo $x
# done

echo "while loop"

i=1

while [ $i -le 5 ]; do
    echo "$i"
    ((i=i+1))
done