import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/SGPA/course_bloc.dart';
import 'package:gpa_cal/bloc/SGPA/course_event.dart';
import 'package:gpa_cal/bloc/SGPA/course_state.dart';
import 'package:gpa_cal/custom_widgets/SGPA_container/course_container.dart';
import 'package:gpa_cal/model/course_model.dart';
import 'package:gpa_cal/utils/modes.dart';

class SGPAScreen extends StatelessWidget {
  const SGPAScreen({super.key});
  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
double maxWidth = width > 600 ? (width * 0.7) : width;

    return BlocProvider(
      create: (context) => CourseBloc()..add(const FetchCourse()),
      child: Scaffold(
       
        body: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CoursesLoadedState || state is CourseUpdated) {
              List<Course> courses = (state is CoursesLoadedState)
                  ? state.courses
                  : (state as CourseUpdated).courses;
              double sgpa = (state is CoursesLoadedState)
                  ? state.sgpa
                  : (state as CourseUpdated).sgpa;

              return Center(
                child: Container(
                   width: maxWidth,
                   alignment: Alignment.center,
                   decoration: const BoxDecoration(
                          
                          ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const  SizedBox(height: 16),
                      Center(
                        child: Text(
                          'SGPA: ${sgpa.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color:isDarkMode(context) ?  const Color.fromARGB(255, 202, 23, 23) : Colors.black,),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            return CourseContainer(
                  
                              key:Key('course_$index'),
                  
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
                              onRemoved: () {
                                context.read<CourseBloc>().add(
                                      DeleteContainerEvent(index: index));
                                
                              },
                              
                            );
                          },
                        ),
                      ),
                      
                     const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CourseBloc>().add(const AddCourse());
                        },
                        child: const Text('Add Course'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error fetching data'),
              );
            }
          },
        ),
      ),
    );
  }
}
