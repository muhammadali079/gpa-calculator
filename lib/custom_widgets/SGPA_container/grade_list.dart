

import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  final String? selectedGrade;
  final Function(String?) onChanged;

  Grades({required this.selectedGrade, required this.onChanged});

  final List<String> gradeList = [
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Select Grade" ),
      value: selectedGrade == null || selectedGrade!.isEmpty ? null : selectedGrade,
      items: [
        DropdownMenuItem<String>(
          value: null,
          child: Text("Select Grade" ),
        ),
        ...gradeList.map((String grade) {
          return DropdownMenuItem<String>(
            value: grade,
            child: Text(grade ),
          );
        }),
      ],
      onChanged: onChanged,
    );
  }
}
