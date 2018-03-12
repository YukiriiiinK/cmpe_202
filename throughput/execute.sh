#!/bin/bash
x1=33
x4=31
x16=29
x64=27
x256=25

for X in 1 4 16 64 256
do
for worker in 1 2 4 8
do
echo "benchmarking on X / $X with $worker threads"
x_points=x${X}
points=${!x_points}
perf stat -d node ./estimate-pi-in-parallel_cus.js $worker $points
done
done

