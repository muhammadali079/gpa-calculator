import 'package:gpa_cal/model/course_model.dart';
import 'package:gpa_cal/model/semester_model.dart';
import 'package:gpa_cal/utils/gradeToQualityPoints.dart';

double calculateSGPA(List<Course> courses) {
  if (courses.isEmpty) {
    return 0.0; 
  }

  double totalQualityPoints = 0.0;
  int totalCreditHours = 0;

  for (var course in courses) {
    double qualityPoints = gradeToQualityPoints[course.grade] ?? 0.0;
    totalQualityPoints = totalQualityPoints + (qualityPoints * course.creditHours);
    totalCreditHours += course.creditHours;
  }

  if (totalCreditHours == 0) {
    return 0.0; 
  }

  return totalQualityPoints / totalCreditHours;
}

double calculateCGPA(List<Semester> semesters) {
  if (semesters.isEmpty) {
    return 0.0; 
  }

  double totalQualityPoints = 0.0;
  int totalCreditHours = 0;

  for (var semester in semesters) {
    
    totalQualityPoints = totalQualityPoints + (semester.sgpa * semester.creditHours);
    totalCreditHours += semester.creditHours;
  }
  if (totalCreditHours == 0) {
    return 0.0; 
  }

  return totalQualityPoints / totalCreditHours;
}