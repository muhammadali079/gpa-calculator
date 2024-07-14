import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/SGPA/course_event.dart';
import 'package:gpa_cal/bloc/SGPA/course_state.dart';
import 'package:gpa_cal/model/course_model.dart';
import 'package:gpa_cal/utils/gpa_cal_methods.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<AddCourse>(_onAddCourse);
    on<UpdateGradeEvent>(_onUpdateGrade);
    on<UpdateNameEvent>(_onUpdateName);
    on<UpdateCreditHoursEvent>(_onUpdateCreditHours);
    on<FetchCourse>(_onFetchCourse);
    on<DeleteContainerEvent>(_onDeleteContainer);
  }

  List<Course> _courses = [];

  void _onAddCourse(AddCourse event, Emitter<CourseState> emit) {
    _courses.add(Course(name: '',  creditHours: 0 ,grade:'A'));
    final SGPA = calculateSGPA(_courses);
    emit(CourseUpdated(courses: _courses, sgpa:  SGPA));
  }

  void _onUpdateGrade(UpdateGradeEvent event, Emitter<CourseState> emit) {
    if (event.index >= 0 && event.index < _courses.length) {
      _courses[event.index].grade = event.newGrade;
       final SGPA = calculateSGPA(_courses);
      emit(CourseUpdated(courses: _courses ,sgpa:  SGPA));
    }
  }
    void _onUpdateName(UpdateNameEvent event, Emitter<CourseState> emit) {
    if (event.index >= 0 && event.index < _courses.length) {
      print("${event.newName}");
      _courses[event.index].name = event.newName;
       final SGPA = calculateSGPA(_courses);
      emit(CourseUpdated(courses: _courses ,sgpa:  SGPA));
    }
  }

  void _onUpdateCreditHours(UpdateCreditHoursEvent event, Emitter<CourseState> emit) {
    if (event.index >= 0 && event.index < _courses.length) {
      _courses[event.index].creditHours = event.newCreditHours;
       final SGPA = calculateSGPA(_courses);
      emit(CourseUpdated(courses: _courses ,sgpa:  SGPA));
    }
  }
   void _onFetchCourse(FetchCourse event, Emitter<CourseState> emit) {
    _courses.add(Course(name: '',  creditHours: 0 ,grade:""));
    _courses.add(Course(name: '',  creditHours: 0 ,grade:''));
    _courses.add(Course(name: '',  creditHours: 0 ,grade:''));
     final SGPA = calculateSGPA(_courses);
    emit(CoursesLoadedState(courses: _courses, sgpa: SGPA));
   }

    void _onDeleteContainer(DeleteContainerEvent event, Emitter<CourseState> emit) {
      print("Before removing");
      _courses.forEach((course) {
  print('Name: ${course.name}');
  print('Credit Hours: ${course.creditHours}');
  print('Grade: ${course.grade}');
});

     _courses.removeAt(event.index);

      print("After removing");
      _courses.forEach((course) {
  print('Name: ${course.name}');
  print('Credit Hours: ${course.creditHours}');
  print('Grade: ${course.grade}');
});
     final SGPA = calculateSGPA(_courses);
    emit(CourseUpdated(courses: List.from(_courses), sgpa: SGPA));
    
      
  }
}
