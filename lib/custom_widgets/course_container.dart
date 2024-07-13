import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/course_name.dart';
import 'package:gpa_cal/custom_widgets/credit_hour_list.dart';
import 'package:gpa_cal/custom_widgets/grade_list.dart';

class CourseContainer extends StatelessWidget {
   //Course course = Course(name: '' , creditHours: 0 , grade: '') ;

  CourseContainer({super.key});
  int  creditHour = 0;
  String grade = '';



  double calculateGPA() {
    final Map<String, double> gradeToQualityPoints = {
      'A+': 4.0,
      'A': 4.0,
      'A-': 3.67,
      'B+': 3.33,
      'B': 3.0,
      'B-': 2.67,
      'C+': 2.33,
      'C': 2.0,
      'C-': 1.67,
      'D+': 1.33,
      'D': 1.0,
      'F': 0.0,
    };

    if (gradeToQualityPoints[grade] == null) {
      return 0.0;
    }
    return creditHour * gradeToQualityPoints[grade]!;
  }

  int getCreditHours() => creditHour;
  
    void updateGrade(String newGrade) {
        print('newly value $newGrade');  
          grade = newGrade;
         
    }
       void updateCreditHour(int newCreditHour) {
      print('newly value $newCreditHour');
     
        creditHour = newCreditHour;
       
  
     
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          CourseName(),
          Row(
            children: [
              Expanded(
                child: Grades(
                  onChanged: updateGrade,
                ),
              ),
              Expanded(
                child: CreditHours(
                  onChanged: updateCreditHour,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


