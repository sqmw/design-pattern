import 'dart:math';

import 'package:design_pattern/3_behavior_10_types/1_chain_of_responsibility/chain_of_responsibility.dart';

class Solution {
  int countPrimes(int n) {
    int isPrime(int val) {
      if (pow(sqrt(val).floor(), 2) == val) {
        return 0;
      }
      for (int i = 2; i <= sqrt(val).ceil(); i++) {
        if (val % i == 0) {
          return 0;
        }
      }
      return 1;
    }

    if (n <= 2) {
      return 0;
    } else if (n == 3) {
      return 1;
    }

    int primeCount = 2;

    for (int item = 4; item < n; item++) {
      primeCount += isPrime(item);
    }

    return primeCount;
  }
}

void main() {
  Expense expense = Expense(100);
  expense.amount = 102;
  print(expense.amount);
}
