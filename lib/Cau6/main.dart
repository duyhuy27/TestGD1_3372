import 'FindMediun.dart';

void main() {
  List<int> arr1 = [1, 2, 5, 7, 8];
  List<int> arr2 = [3, 4, 6];

  FindMedian findMedian = FindMedian();
  int median = findMedian.findMedian(arr1, arr2);
  print('Số ở giữa là số: $median');
}
