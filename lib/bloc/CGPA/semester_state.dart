
import 'package:gpa_cal/model/semester_model.dart';

abstract class SemesterState {}

class SemesterInitial extends SemesterState {
  

  SemesterInitial();
}
class SemesterLoadedState extends SemesterState {
  final List<Semester> semester;
   final double cgpa;

  SemesterLoadedState({required this.semester , required this.cgpa});
}
class SemesterUpdated extends SemesterState {
 final List<Semester> semester;
   final double cgpa;

  SemesterUpdated({required this.semester, required this.cgpa});
}
