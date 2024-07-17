import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/SGPA_container/course_name.dart';
import 'package:gpa_cal/custom_widgets/SGPA_container/credit_hour_list.dart';
import 'package:gpa_cal/custom_widgets/SGPA_container/grade_list.dart';
import 'package:gpa_cal/model/course_model.dart';
import 'package:gpa_cal/utils/modes.dart';

class CourseContainer extends StatelessWidget {
  final int index;
  final Course course;
  final Function(String?, int?, String?) onChanged;
  final VoidCallback onRemoved;

 CourseContainer({
    required Key key, 
    required this.index,
    required this.course,
    required this.onChanged,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = isDarkMode(context)? Colors.white : Colors.black;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
    
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CourseName(
                    initialValue: course.name!,
                    onChanged: (name) => onChanged(null, null, name),
                  ),
                ),
                IconButton(
                  onPressed: onRemoved,
                  icon: Icon(Icons.remove_circle_outline_rounded),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CreditHours(
                    initialValue: course.creditHours,
                    onChanged: (creditHours) =>
                        onChanged(null, creditHours, null),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Grades(
                    selectedGrade: course.grade,
                    onChanged: (grade) => onChanged(grade, null, null),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

