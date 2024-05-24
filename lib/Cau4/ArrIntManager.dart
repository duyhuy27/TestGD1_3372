class ArrIntManager {
  List<int> arrInt;
  ArrIntManager(this.arrInt);

// calculate sum of number in array
  int sumOfArray() {
    return arrInt.reduce((value, element) => value + element);
  }

  // check is preme or not
  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  // sum of prime number in array
  int sumOfPrimes() {
    return arrInt.where((element) => isPrime(element)).fold(0, (prev, element) => prev + element);
  }

  //find and print the set of 3 in a row that have: arrInt[i] + arrInt[i+1] = arrInt[i+2]
  void findConsecutiveTriplets() {
    for (int i = 0; i < arrInt.length - 2; i++) {
      if (arrInt[i] + arrInt[i + 1] == arrInt[i + 2]) {
        print("Found consecutive triplets: ${arrInt[i]}, ${arrInt[i + 1]}, ${arrInt[i + 2]}");
      }
    }
  }

  // find and print the longest subarray with sum = S
  void findLongestSubArrayWithSum(int S) {
    int maxLength = 0;
    int start = -1;
    int sum = 0;

    Map<int, int> sumIndices = {};

    for (int i = 0; i < arrInt.length; i++) {
      sum += arrInt[i];
      if (sum == S) {
        maxLength = i + 1;
        start = 0;
      } else if (sumIndices.containsKey(sum - S) && i - sumIndices[sum - S]! > maxLength) {
        maxLength = i - sumIndices[sum - S]!;
        start = sumIndices[sum - S]! + 1;
      }

      if (!sumIndices.containsKey(sum)) {
        sumIndices[sum] = i;
      }
    }

    if (start == -1) {
      print("No subarray found with sum $S");
    } else {
      print("Longest subarray with sum $S is from index $start to ${start + maxLength - 1}");
    }
  }

  // find and print the longest stable increasing-decreasing sequence
  void findLongestStableIncreasingDecreasingSequence() {
    int maxLength = 0;
    int start = -1;

    int i = 0;
    while (i < arrInt.length) {
      int j = i + 1;
      while (j < arrInt.length && arrInt[j] > arrInt[j - 1]) {
        j++;
      }
      int k = j;
      while (k < arrInt.length && arrInt[k] < arrInt[k - 1]) {
        k++;
      }

      int currentLength = k - i;
      if (currentLength > maxLength) {
        maxLength = currentLength;
        start = i;
      }
      i = k;
    }

    if (start == -1) {
      print("No stable increasing-decreasing sequence found.");
    } else {
      print(
          "Longest stable increasing-decreasing sequence starts at index $start with length $maxLength");
      print("Sequence: ${arrInt.sublist(start, start + maxLength)}");
    }
  }
}
