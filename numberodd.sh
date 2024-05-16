#!/bin/bash
for i in {0..10}; do
    if [ $(expr $i % 2) -ne 0 ]; then
        echo "$i is odd"
    else
        echo "$i is even"
    fi
done
