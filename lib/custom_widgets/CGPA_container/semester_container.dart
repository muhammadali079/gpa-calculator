import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_gpa.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_hours.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_name.dart';
import 'package:gpa_cal/model/semester_model.dart';

class SemesterContainer extends StatelessWidget {
  final int index;
  final Semester semester;
  final Function(String?, int?, double?) onChanged;
  final VoidCallback onRemoved;

  SemesterContainer({
    required Key key,
    required this.index,
    required this.semester,
    required this.onChanged,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SemesterName(
                  initialValue: semester.name!,
                  onChanged: (name) => onChanged(name, null, null),
                ),
                IconButton(
                  onPressed: onRemoved,
                  icon: Icon(Icons.remove_circle_outline_rounded),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreditHours(
                  initialValue: semester.creditHours,
                  onChanged: (creditHours) => onChanged(null, creditHours, null),
                ),
                SizedBox(width: 8),
                SGPA(
                  initialValue: semester.sgpa,
                  onChanged: (sgpa) => onChanged(null, null, sgpa),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
