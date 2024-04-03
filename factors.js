'use strict';

if (process.argv.length !== 3) {
    console.log('Usage: node factors.js <number>');
    process.exit(1);
}

function calcFactors(number) {
    const factorsHash = {};
    let current = number
    let i = 2
    while (i <= number / 2) {
        if (current % i === 0) {
            current = current / i;
            if (factorsHash[i]) {
                factorsHash[i] += 1;
            } else {
                factorsHash[i] = 1;
            }
        } else {
            i++;
        }
    }
    return factorsHash;
}

function printFactors(factors) {
    const result = [];
    for (const key in factors) {
        if (factors[key] > 1) {
            result.push(`${key}^${factors[key]}`)
        } else {
            result.push(`${key}`)
        }
    }
    return result.join(', ')
}

const num = process.argv[2]
const res = calcFactors(num)
if (Object.keys(res).length === 0) {
    console.log(`${num} is a prime number`)
} else {
    console.log(`factors for ${num} are: (${printFactors(res)})`)
}

