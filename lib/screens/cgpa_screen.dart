import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_cal/bloc/CGPA/semester_bloc.dart';
import 'package:gpa_cal/bloc/CGPA/semester_event.dart';
import 'package:gpa_cal/bloc/CGPA/semester_state.dart';

import 'package:gpa_cal/custom_widgets/CGPA_container/semester_container.dart';
import 'package:gpa_cal/model/semester_model.dart';
import 'package:gpa_cal/utils/modes.dart';

class CGPAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
double maxWidth = width > 600 ? (width * 0.7) : width;
    return BlocProvider(
      create: (context) => SemesterBloc()..add(FetchSemester()),
      child: Scaffold(
        
        body: BlocBuilder<SemesterBloc, SemesterState>(
          builder: (context, state) {
            if (state is SemesterInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SemesterLoadedState || state is SemesterUpdated) {
              List<Semester> semesters = (state is SemesterLoadedState)
                  ? state.semester
                  : (state as SemesterUpdated).semester;
              double cgpa = (state is SemesterLoadedState)
                  ? state.cgpa
                  : (state as SemesterUpdated).cgpa;

              return Center(
                child: Container(
                  width: maxWidth,
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'CGPA: ${cgpa.toStringAsFixed(2)}',
                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color:isDarkMode(context) ?   Color.fromARGB(255, 202, 23, 23) : Colors.black,),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: semesters.length,
                          itemBuilder: (context, index) {
                            return SemesterContainer(
                              key: Key('semester_$index'),
                              index: index,
                              semester: semesters[index],
                              onChanged: (name, creditHours, sgpa) {
                                if (name != null) {
                                  context.read<SemesterBloc>().add(
                                    UpdateSemesterNameEvent(index, name),
                                  );
                                }
                                if (creditHours != null) {
                                  context.read<SemesterBloc>().add(
                                    UpdateSemesterCreditHoursEvent(index, creditHours),
                                  );
                                }
                                if (sgpa != null) {
                                  context.read<SemesterBloc>().add(
                                    UpdateSemesterGPAEvent(index, sgpa),
                                  );
                                }
                              },
                              onRemoved: () {
                                context.read<SemesterBloc>().add(
                                  DeleteContainerEvent(index: index),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SemesterBloc>().add(AddSemester());
                        },
                        child: Text('Add Semester'),
                      ),
                    ],
                  ),
                ),
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
