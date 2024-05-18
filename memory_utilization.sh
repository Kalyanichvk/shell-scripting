#!/bin/bash
TOTAL_MEM=$(free -m | grep -i mem | awk -F " " '{print $2}')
TOTAL_AVL=$(free -m | grep -i mem | awk -F " " '{print $7}')
USED_MEMORY=$(expr $TOTAL_MEM - $TOTAL_AVL)
echo "The Total Memory In The Machine Is ${TOTAL_MEM}MB and CURRENT UTILIZATION IS ${USED_MEMORY}MB"
X=$(echo "scale=2; $TOTAL_AVL / $TOTAL_MEM" | bc | tr -d '.')
echo "The Free Memory Percentrage is ${X}%."
if [ $X -lt 10 ]; then
    echo "Current Memory Utilization more than 90%"
else
    echo "Current Memory Utilization is ${X}% and within the limits."
fi