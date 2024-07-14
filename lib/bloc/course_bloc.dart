import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/course_event.dart';
import 'package:gpa_cal/bloc/course_state.dart';
import 'package:gpa_cal/model/course_model.dart';
import 'package:gpa_cal/utils/gpa_cal_methods.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<AddCourse>(_onAddCourse);
    on<UpdateGradeEvent>(_onUpdateGrade);
    on<UpdateNameEvent>(_onUpdateName);
    on<UpdateCreditHoursEvent>(_onUpdateCreditHours);
    on<FetchCourse>(_onFetchCourse);
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
    _courses.add(Course(name: '',  creditHours: 0 ,grade:'A'));
    _courses.add(Course(name: '',  creditHours: 0 ,grade:'A'));
    _courses.add(Course(name: '',  creditHours: 0 ,grade:'A'));
     final SGPA = calculateSGPA(_courses);
    emit(CoursesLoadedState(courses: _courses, sgpa: SGPA));
    
      
  }
}
