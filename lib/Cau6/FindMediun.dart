import 'dart:math' as math;

class FindMedian {
  int findMedian(List<int> arr1, List<int> arr2) {
    int m = arr1.length;
    int n = arr2.length;

    // Đảm bảo arr1 luôn nhỏ hơn hoặc bằng arr2
    if (m > n) {
      return findMedian(arr2, arr1);
    }

    int low = 0; // chỉ số thấp nhất của arr1
    int high = m; // chỉ số cao nhất của arr1

    while (low <= high) {
      int partitionX = (low + high) ~/ 2; // Điểm chia arr1
      int partitionY = (m + n + 1) ~/ 2 - partitionX; // Điểm chia arr2

      // Tìm max của bên trái arr1 và arr2
      int maxLeftX = (partitionX == 0) ? double.negativeInfinity.toInt() : arr1[partitionX - 1];
      int maxLeftY = (partitionY == 0) ? double.negativeInfinity.toInt() : arr2[partitionY - 1];

      // Tìm min của bên phải arr1 và arr2
      int minRightX = (partitionX == m) ? double.infinity.toInt() : arr1[partitionX];
      int minRightY = (partitionY == n) ? double.infinity.toInt() : arr2[partitionY];

      // Nếu max của bên trái <= min của bên phải, thì đã tìm được vị trí đúng
      if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
        // Nếu tổng số phần tử trong mảng là số chẵn
        if ((m + n) % 2 == 0) {
          // Trả về trung bình của max của bên trái lớn nhất và min của bên phải nhỏ nhất
          return ((math.max(maxLeftX, maxLeftY) + math.min(minRightX, minRightY)) ~/ 2).toInt();
        } else {
          // Nếu tổng số phần tử trong mảng là số lẻ, trả về max của bên trái lớn nhất
          return math.max(maxLeftX, maxLeftY);
        }
      } else if (maxLeftX > minRightY) {
        // Nếu max của bên trái arr1 lớn hơn min của bên phải arr2, điều chỉnh chỉ số high
        high = partitionX - 1;
      } else {
        // Nếu max của bên trái arr2 lớn hơn min của bên phải arr1, điều chỉnh chỉ số low
        low = partitionX + 1;
      }
    }

    // Nếu không tìm thấy, trả về -1 (không xảy ra trong trường hợp này)
    return -1;
  }
}
