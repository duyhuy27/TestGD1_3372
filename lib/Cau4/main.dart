import 'ArrIntManager.dart';

void main() {
  List<int> arrInt = [1, 2, 3, 5, 4, 1, 3, 4, 5, 4, 5, 9, 7, 0, 11, 13, 10, 23];
  ArrIntManager arrIntManager = ArrIntManager(arrInt);

  print("Sum of array: ${arrIntManager.sumOfArray()}");
  print("Sum of prime numbers in array: ${arrIntManager.sumOfPrimes()}");

  print("Consecutive triplets:");
  arrIntManager.findConsecutiveTriplets();

  int S = 16;
  print("Longest subarray with sum $S:");
  arrIntManager.findLongestSubArrayWithSum(S);

  arrIntManager.findLongestStableIncreasingDecreasingSequence();
}
