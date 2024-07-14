import 'package:equatable/equatable.dart';

abstract class SemesterEvent extends Equatable {
  const SemesterEvent();

  @override
  List<Object?> get props => [];
}

class AddSemester extends SemesterEvent {
  const AddSemester();

  @override
  List<Object?> get props => [];
}
class FetchSemester extends SemesterEvent{
  const FetchSemester();

  @override
  List<Object?> get props => [];

}

class UpdateSemesterGPAEvent extends SemesterEvent {
  final int index;
  final double newSGPA;

  UpdateSemesterGPAEvent(this.index, this.newSGPA);
}
class UpdateSemesterNameEvent extends SemesterEvent {
  final int index;
  final String newName;

  UpdateSemesterNameEvent(this.index, this.newName);
}

class UpdateSemesterCreditHoursEvent extends SemesterEvent {
  final int index;
  final int newCreditHours;

  UpdateSemesterCreditHoursEvent(this.index, this.newCreditHours);
}

class DeleteContainerEvent extends SemesterEvent {
  final int index;


  DeleteContainerEvent({required this.index});
}