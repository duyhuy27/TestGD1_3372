class Student {
  String name;
  int age;
  double math;
  double physical;
  double chemistry;
  double avg;
  String rank;

  Student({
    required this.name,
    required this.age,
    required this.math,
    required this.physical,
    required this.chemistry,
    this.avg = 0,
    this.rank = '',
  });

  // 7.b
  void calculateAvgAndRank() {
    avg = (math + physical + chemistry) / 3;
    if (avg >= 8.0) {
      rank = 'GIOI';
    } else if (avg >= 6.5) {
      rank = 'KHA';
    } else if (avg >= 5.0) {
      rank = 'TB';
    } else {
      rank = 'YEU';
    }
  }
}
