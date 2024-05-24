class ManagerInt {
  // hàm có param là List<int> m và int n
  void sumK(List<int> m, int n) {
    List<List<int>> result = [];

    // hàm tìm ra 1 dãy con ( có thể không liên tiếp có sum = n )
    _findSubarrays(m, n, 0, [], result);

    // conditional check result.
    // Nếu không co dãy con nào có tổng bằng n thì in ra thông báo
    if (result.isEmpty) {
      print("Không có dãy con nào có tổng bằng $n");
    } else {
      // Nếu result khác null thì in ra các dãy con có tổng bằng n
      for (List<int> subarray in result) {
        print("$n = ${subarray.join(' + ')}");
      }
    }
  }

  // hàm đệ quy tìm ra các dãy con có tổng = n
  // param: List<int> m, int n, int index, List<int> current, List<List<int>> result. Trong đó
  // m: array chứa các element cần được duyệt
  // n: tổng cần tìm
  // index: index của số phần tử hienej tại trong mảng m
  // current: list chứa array con

  void _findSubarrays(List<int> m, int n, int index, List<int> current, List<List<int>> result) {
    // nếu n = 0 thì thêm dãy con hiện tại vào result
    if (n == 0) {
      result.add(List.from(current));
      return;
    }
    // nếu đã duyệt hết mảng m thì return, end function
    if (index == m.length) {
      return;
    }

    if (m[index] <= n) {
      current.add(m[index]);
      _findSubarrays(m, n - m[index], index + 1, current, result);
      current.removeLast();
    }

    _findSubarrays(m, n, index + 1, current, result);
  }
}
