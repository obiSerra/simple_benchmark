import argparse


def factors(num):
    i = 2
    current = num

    factors = {}

    while i <= num / 2:
        if current % i == 0:
            if i in factors:
                factors[i] += 1
            else:
                factors[i] = 1
            current = current / i
        else:
            i += 1

    return factors


def printOutput(factors):
    out = []
    for key, value in factors.items():
        if value == 1:
            out.append(f"{key}")
        else:
            out.append(f"{key}^{value}")

    return ", ".join(out)


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("num", type=int, help="Number to calculate factors")
    args = parser.parse_args()

    divs = factors(args.num)
    if len(divs) == 0:
        print(f"{args.num} is a prime number")
    else:
        print(f"factors for {args.num} are: ({printOutput(divs)})")
