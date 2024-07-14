import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/course_bloc.dart';
import 'package:gpa_cal/bloc/course_event.dart';
import 'package:gpa_cal/bloc/course_state.dart';
import 'package:gpa_cal/custom_widgets/course_container.dart';
import 'package:gpa_cal/model/course_model.dart';

class SGPAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc()..add(FetchCourse()),
      child: Scaffold(
       
        body: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CoursesLoadedState || state is CourseUpdated) {
              List<Course> courses = (state is CoursesLoadedState)
                  ? state.courses
                  : (state as CourseUpdated).courses;
              double sgpa = (state is CoursesLoadedState)
                  ? state.sgpa
                  : (state as CourseUpdated).sgpa;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'SGPA: ${sgpa.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return CourseContainer(
                          index: index,
                          course: courses[index],
                          onChanged: (grade, creditHours , name) {
                            if (grade != null) {
                              context.read<CourseBloc>().add(
                                  UpdateGradeEvent(index, grade));
                            }
                            if (creditHours != null) {
                              context.read<CourseBloc>().add(
                                  UpdateCreditHoursEvent(index, creditHours));
                            }
                             if (name != null) {
                              context.read<CourseBloc>().add(
                                  UpdateNameEvent(index, name));
                            }
                          },
                        );
                      },
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CourseBloc>().add(AddCourse());
                    },
                    child: Text('Add Course'),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Error fetching data'),
              );
            }
          },
        ),
      ),
    );
  }
}
