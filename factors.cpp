#include <iostream>
#include <list>
#include <map>

using namespace std;

string formatOutput(map<long, string> factors)
{
    string formatted = "";

    for (auto const &[key, val] : factors)
    {
        if (val == "1")
            formatted += to_string(key) + ", ";
        else
            formatted += to_string(key) + "^" + val + ", ";
    }

    return formatted.substr(0, formatted.size() - 2);
}

int main(int argc, char *argv[])
{

    if (argc < 2)
    {
        cout << "No argument entered";
        return 1;
    }

    map<long, string> factors;

    long base = stol(argv[1]);
    long i = 2;
    long current = base;
    while (i <= base / 2)
    {
        if (current % i == 0)
        {
            if (factors.find(i) == factors.end())
            {
                factors[i] = "1";
            }
            else
            {
                factors[i] = to_string(stol(factors[i]) + 1);
            }
            current = current / i;
        }
        else
        {
            i++;
        }
    }

    if (factors.size() == 0)
        cout << base << " is a prime number" << endl;
    else
        cout << "factors for " << base << " are: (" << formatOutput(factors) << ")" << endl;
    return 0;
}
