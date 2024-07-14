import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/CGPA/semester_event.dart';
import 'package:gpa_cal/bloc/CGPA/semester_state.dart';
import 'package:gpa_cal/model/semester_model.dart';
import 'package:gpa_cal/utils/gpa_cal_methods.dart';


class SemesterBloc extends Bloc<SemesterEvent, SemesterState> {
  SemesterBloc() : super(SemesterInitial()) {
    on<AddSemester>(_onAddSemester);
    on<UpdateSemesterGPAEvent>(_onUpdateSemesterGrade);
    on<UpdateSemesterNameEvent>(_onUpdateName);
    on<UpdateSemesterCreditHoursEvent>(_onUpdateSemesterCreditHours);
    on<FetchSemester>(_onFetchSemester);
    on<DeleteContainerEvent>(_onDeleteContainer);
  }

  List<Semester> _semester = [];

  void _onAddSemester(AddSemester event, Emitter<SemesterState> emit) {
    _semester.add(Semester(name: '',  creditHours: 0 ,sgpa:0.0));
    final CGPA = calculateCGPA(_semester);
    emit(SemesterUpdated(semester: _semester, cgpa: CGPA));
  }

  void _onUpdateSemesterGrade(UpdateSemesterGPAEvent event, Emitter<SemesterState> emit) {
    if (event.index >= 0 && event.index < _semester.length) {
      _semester[event.index].sgpa = event.newSGPA;
      final CGPA = calculateCGPA(_semester);
    emit(SemesterUpdated(semester: _semester, cgpa: CGPA));
    }
  }
    void _onUpdateName(UpdateSemesterNameEvent event, Emitter<SemesterState> emit) {
    if (event.index >= 0 && event.index < _semester.length) {
      print("${event.newName}");
      _semester[event.index].name = event.newName;
    final CGPA = calculateCGPA(_semester);
    emit(SemesterUpdated(semester: _semester, cgpa: CGPA));
    }
  }

  void _onUpdateSemesterCreditHours(UpdateSemesterCreditHoursEvent event, Emitter<SemesterState> emit) {
    if (event.index >= 0 && event.index < _semester.length) {
      _semester[event.index].creditHours = event.newCreditHours;
      final CGPA = calculateCGPA(_semester);
    emit(SemesterUpdated(semester: _semester, cgpa: CGPA));
    }
  }
   void _onFetchSemester(FetchSemester event, Emitter<SemesterState> emit) {
    _semester.add(Semester(name: '',  creditHours: 0 ,sgpa:0.0));
   _semester.add(Semester(name: '',  creditHours: 0 ,sgpa:0.0));
  _semester.add(Semester(name: '',  creditHours: 0 ,sgpa:0.0));
     final CGPA = calculateCGPA(_semester);
    emit(SemesterLoadedState(semester: _semester, cgpa: CGPA));
   }

    void _onDeleteContainer(DeleteContainerEvent event, Emitter<SemesterState> emit) {
      print("Before removing");
      _semester.forEach((course) {
  print('Name: ${course.name}');
  print('Credit Hours: ${course.creditHours}');
  print('Grade: ${course.sgpa}');
});

     _semester.removeAt(event.index);

      print("After removing");
      _semester.forEach((course) {
  print('Name: ${course.name}');
  print('Credit Hours: ${course.creditHours}');
  print('Grade: ${course.sgpa}');
});
     final CGPA = calculateCGPA(_semester);
    emit(SemesterUpdated(semester: List.from(_semester), cgpa: CGPA));
    
      
  }
}
