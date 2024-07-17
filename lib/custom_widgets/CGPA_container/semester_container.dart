import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_gpa.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_hours.dart';
import 'package:gpa_cal/custom_widgets/CGPA_container/semester_name.dart';
import 'package:gpa_cal/model/semester_model.dart';
import 'package:gpa_cal/utils/modes.dart';

class SemesterContainer extends StatelessWidget {
  final int index;
  final Semester semester;
  final Function(String?) onNameChanged;
  final Function(int?) onCreditHoursChanged;
  final Function(double?) onSGPAChanged;
  final VoidCallback onRemoved;

  SemesterContainer({
    required Key key,
    required this.index,
    required this.semester,
    required this.onNameChanged,
    required this.onCreditHoursChanged,
    required this.onSGPAChanged,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = isDarkMode(context) ? Colors.white : Colors.black;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SemesterName(
                  initialValue: semester.name!,
                  onChanged: onNameChanged,
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
                  onChanged: onCreditHoursChanged,
                ),
                SizedBox(width: 8),
                SGPA(
                  initialValue: semester.sgpa,
                  onChanged: onSGPAChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
