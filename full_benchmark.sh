#!/usr/bin/env bash

cmd="command time"

iterations=10

if [ $(which gtime) ]; then
    cmd="gtime"
fi

if [[ $# -lt 1 ]]; then
    echo "Usage: full_benchmark.sh <program>"
    exit 1
fi

toBenchmark="$@"
outName="out/$(echo $toBenchmark | sed -E 's/[\s \/ \.]+/_/g' | sed -E 's/(^[_]+|[_]$)+//g').csv"

echo "Benchmarking $toBenchmark with $iterations iterations."

{ echo "Elapsed,User,System,Memory"; } > $outName

for i in $(seq 1 $iterations);
do
    echo "Iteration $i"
    { $cmd -f "%E,%U,%S,%M" $toBenchmark 1>/dev/null ; } 2>> $outName
done

echo "Benchmarking complete. Results saved to $outName."