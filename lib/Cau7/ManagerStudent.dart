import 'Student.dart';

class ManagerStudent {
  List<Student> students = [];

  // 7.a
  void addStudent(Student student) {
    student.calculateAvgAndRank();
    students.add(student);
  }

  // 7 .c
  Student? findStudentByName(String name) {
    return students.firstWhere((student) => student.name == name, orElse: () => null!);
  }

  // 7.d
  List<Student> getExcellentStudents() {
    return students.where((student) => student.rank == 'GIOI').toList();
  }

  // 7.e
  void sortStudents() {
    students.sort((a, b) {
      int cmp = a.name.compareTo(b.name);
      if (cmp != 0) return cmp;
      return a.avg.compareTo(b.avg);
    });
  }

  // 7.f
  List<Student> smartSearch(String content) {
    List<Student> result = [];

    for (var student in students) {
      if (student.name.toLowerCase() == content.toLowerCase()) {
        result.add(student);
      } else if (student.name.toLowerCase().contains(content.toLowerCase())) {
        result.add(student);
      }
    }

    return result;
  }
}
