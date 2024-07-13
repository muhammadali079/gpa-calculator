import 'package:flutter/material.dart';

class Grades extends StatefulWidget {
  final Function(String)? onChanged; 
  @override
   Grades({super.key , required this.onChanged});

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  final List<String> grades = ['A+' , 'A' , 'A-' , 'B+' , 'B' , 'B-' , 'C+' , 'C' , 'C-' , 'D+' , 'D' , 'F'];

   String? _selectedGrade;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedGrade,
      hint: Text('Select Grade'),
      items: grades.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(), 
      onChanged: (String? selectedGrade) {
        print('Selected grade: $selectedGrade');
        setState(() {
               _selectedGrade =  selectedGrade;
        });
        if (widget.onChanged!=null){
              widget.onChanged!(selectedGrade!);
        }
      },
    );
  }
}