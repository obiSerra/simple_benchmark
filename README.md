# Simple Benchmark

This is just an (almost) useless benchmark to compare the performance of different programming languages.

## The task

The task is to calculate the prime factors of a number. The number is given as a command line argument.

The algorithm is not optimized and is just a simple brute force algorithm, but it is the same for all languages:

1. Set `current` as the number `num` to be factored.
2. Starting from 2 (`i`), check if `current` is divisible by `i`.
3. if it is, add `i` to the list of prime factors and set `current` as `current`/`i`.
4. if it is not, increment `i` by 1.
5. keep doing this until the `i` is equal to `num` / 2.
6. At the end pretty print the list of prime factors or a sentence saying that the `num` is a prime number.



## How to use it

To run the benchmark, you need to have the corresponding language installed on your machine.

For `c++` you first need to compile the code using `c++` version 17 or higher.

```bash
$ ./bench.sh <the command you want to run>
``` 

