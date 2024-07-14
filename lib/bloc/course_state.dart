import 'package:gpa_cal/model/course_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {
  

  CourseInitial();
}
class CoursesLoadedState extends CourseState {
  final List<Course> courses;
   final double sgpa;

  CoursesLoadedState({required this.courses , required this.sgpa});
}
class CourseUpdated extends CourseState {
  final List<Course> courses;
  final double sgpa;

  CourseUpdated({required this.courses, required this.sgpa});
}
