import 'package:test_gd1/Cau7/ManagerStudent.dart';
import 'package:test_gd1/Cau7/Student.dart';

void main() {
  ManagerStudent manager = ManagerStudent();

  // Thêm sinh viên
  manager.addStudent(Student(name: "Alice", age: 18, math: 9, physical: 8.5, chemistry: 9));
  manager.addStudent(Student(name: "Bob", age: 17, math: 7, physical: 6.5, chemistry: 7.5));
  manager.addStudent(Student(name: "Charlie", age: 19, math: 6, physical: 5.5, chemistry: 6));
  manager.addStudent(Student(name: "David", age: 20, math: 8, physical: 7.5, chemistry: 8));
  manager.addStudent(Student(name: "Eva", age: 21, math: 7, physical: 6.5, chemistry: 7));
  manager.addStudent(Student(name: "Frank", age: 22, math: 6, physical: 5.5, chemistry: 6));
  manager.addStudent(Student(name: "Gina", age: 23, math: 8, physical: 7.5, chemistry: 8));
  manager.addStudent(Student(name: "Helen", age: 24, math: 7, physical: 6.5, chemistry: 7));
  manager.addStudent(Student(name: "Ivy", age: 25, math: 6, physical: 5.5, chemistry: 6));
  manager.addStudent(Student(name: "Jack", age: 26, math: 8, physical: 7.5, chemistry: 8));

  // Tìm kiếm sinh viên theo tên
  Student? student = manager.findStudentByName("Alice");
  if (student != null) {
    print("${student.name}, Rank: ${student.rank}, Avg: ${student.avg}");
  }

  //display student with avg and rank
  for (var student in manager.students) {
    print("${student.name}, Rank: ${student.rank}, Avg: ${student.avg}");
  }

  // Lấy danh sách sinh viên có rank giỏi
  List<Student> excellentStudents = manager.getExcellentStudents();
  for (var student in excellentStudents) {
    print("List student rank GIOI:  ${student.name}, Rank: ${student.rank}");
  }

  // Sắp xếp sinh viên tăng dần theo AlphaB
  manager.sortStudents();
  for (var student in manager.students) {
    print("${student.name}, Rank: ${student.rank}, Avg: ${student.avg}");
  }

  // Smart search câu 7.f
  List<Student> searchResults = manager.smartSearch("A");
  for (var student in searchResults) {
    print("${student.name}, Rank: ${student.rank}");
  }
}
