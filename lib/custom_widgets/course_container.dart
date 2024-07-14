import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/course_name.dart';
import 'package:gpa_cal/custom_widgets/credit_hour_list.dart';
import 'package:gpa_cal/custom_widgets/grade_list.dart';
import 'package:gpa_cal/model/course_model.dart';

class CourseContainer extends StatelessWidget {
  final int index;
  final Course course;
  final Function(String?, int? , String?) onChanged;

  CourseContainer({
    required this.index,
    required this.course,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),),
        child: Column(
          children: [
            // Text('Course ${index + 1}', style: TextStyle(fontSize: 18)),
            CourseName(initialValue: course.name!,onChanged: (name) => onChanged( null,null , name),),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CreditHours(
              initialValue: course.creditHours,
              onChanged: (creditHours) => onChanged(null, creditHours,null),
            ),
            //SizedBox(width: 20),
            Grades(
              selectedGrade: course.grade,
              onChanged: (grade) => onChanged(grade ,null , null ),
            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
