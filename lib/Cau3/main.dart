import 'package:test_gd1/Cau3/MyString.dart';

void main() {
  var stringTest = "Hello programers. Im Developer";

  var _myString = MyString(stringTest);
  print(_myString.totalASCIIInString());
  print(_myString.totalASCIIUpperCaseInString());

  var n = 2;
  Map<String, int> result = _myString.frequentCharacters(n);
  result.forEach((key, value) {
    print("Key: $key, Value: $value");
  });

  var s1 = "Hello";
  var s2 = "Hello programers. Im Developer";
  print(_myString.longestCommonSubstring(s1, s2));
}
