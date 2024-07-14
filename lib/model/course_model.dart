
class Course {
    String? name;
  int creditHours;
  String grade;

  Course({this.name, required this.creditHours, required this.grade});

  double getGradePoint() {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }
}

