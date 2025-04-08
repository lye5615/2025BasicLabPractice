import 'dart:convert';
import 'dart:math';

class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }

  void setAvg() => avg = (kor + eng + math) / 3.0;

  String get status => avg >= 60.0 ? "PASS" : "FAIL";
}

void main() {
  var alist = List<Student>.empty(growable: true);

  for (int i = 0; i < 10; i++) {
    Student a = Student();
    a.name = AsciiDecoder().convert([65 + i]); // A, B, C, ...
    a.setAvg();
    alist.add(a);
  }

  // 정렬 전 출력
  print("이름  국어  영어  수학   평균   상태");
  for (var student in alist) {
    printRow(student);
  }

  print("\n--- 평균 기준 오름차순 정렬 ---\n");

  List<Student> newList = List.from(alist);
  newList.sort((a, b) => a.avg.compareTo(b.avg));

  print("이름  국어  영어  수학   평균   상태");
  for (var student in newList) {
    printRow(student);
  }
}

void printRow(Student s) {
  String row = s.name.padLeft(4) +
      s.kor.toString().padLeft(6) +
      s.eng.toString().padLeft(6) +
      s.math.toString().padLeft(6) +
      s.avg.toStringAsFixed(1).padLeft(8) +
      s.status.padLeft(8);
  print(row);
}
