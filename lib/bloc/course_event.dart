import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object?> get props => [];
}

class AddCourse extends CourseEvent {
  const AddCourse();

  @override
  List<Object?> get props => [];
}
class FetchCourse extends CourseEvent{
  const FetchCourse();

  @override
  List<Object?> get props => [];

}

class UpdateGradeEvent extends CourseEvent {
  final int index;
  final String newGrade;

  UpdateGradeEvent(this.index, this.newGrade);
}
class UpdateNameEvent extends CourseEvent {
  final int index;
  final String newName;

  UpdateNameEvent(this.index, this.newName);
}

class UpdateCreditHoursEvent extends CourseEvent {
  final int index;
  final int newCreditHours;

  UpdateCreditHoursEvent(this.index, this.newCreditHours);
}
