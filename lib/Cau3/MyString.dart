class MyString {
  String _valueString;

  MyString(this._valueString);

  int totalASCIIInString() {
    int sum = 0;
    for (var c in _valueString.codeUnits) {
      print(_valueString.codeUnits);
      sum += c;
    }
    return sum;
  }

  //Tính tổng bảng mã ASCII của các ký tự in hoa trong chuỗi.
  int totalASCIIUpperCaseInString() {
    int sum = 0;
    for (var c in _valueString.codeUnits) {
      if (c >= 65 && c <= 90) {
        sum += c;
      }
    }
    return sum;
  }

  Map<String, int> frequentCharacters(int n) {
    Map<String, int> frequencyMap = {};
    for (var c in _valueString.runes) {
      String character = String.fromCharCode(c);
      if (character != " ") {
        if (frequencyMap.containsKey(character)) {
          frequencyMap[character] = frequencyMap[character]! + 1;
        } else {
          frequencyMap[character] = 1;
        }
      }
    }

    // Tạo một danh sách các cặp key-value từ frequencyMap
    List<MapEntry<String, int>> sortedEntries = frequencyMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // Sắp xếp theo giá trị giảm dần

    Map<String, int> result = {};
    for (var entry in sortedEntries) {
      if (entry.value >= n) {
        String key = entry.key;
        // Kiểm tra xem ký tự này có cùng số lần xuất hiện với các ký tự trước đó
        bool isSameFrequencyWithPrevious = result.isNotEmpty && entry.value == result.values.first;
        if (isSameFrequencyWithPrevious) {
          // true => thêm ký tự vào chuỗi kết quả thay vì tạo một cặp key-value mới
          result.update(key, (value) => value, ifAbsent: () => entry.value);
        } else {
          // false => tạo một cặp key-value mới
          result[key] = entry.value;
        }
      }
    }

    return result;
  }

  String longestCommonSubstring(String s1, s2) {
    if (s1.isEmpty || s2.isEmpty) {
      return "";
    }

    int maxLengthOfChild = 0; //the length of the longest common substring
    int endIndexOfChild = 0; //the end index of the longest common substring

    List<List<int>> table = List.generate(s1.length + 1, (index) => List.filled(s2.length + 1, 0));

    for (int i = 1; i <= s1.length; i++) {
      for (int j = 1; j <= s2.length; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          table[i][j] = table[i - 1][j - 1] + 1;
          if (table[i][j] > maxLengthOfChild) {
            maxLengthOfChild = table[i][j];
            endIndexOfChild = i;
          }
        }
      }
    }
    return s1.substring(
        endIndexOfChild - maxLengthOfChild, endIndexOfChild); // return chuỗi con dài nhất từ s1
  }
}
