import 'package:flutter/material.dart';

class CourseName extends StatelessWidget {
  @override
   CourseName({super.key });
 @override
  Widget build(BuildContext context) {
    return const TextField(
       decoration: InputDecoration(
        labelText: 'Enter Course Name', 
              hintText: 'Programming Fundamentals', 
              border: OutlineInputBorder(),
       ),
    );
  }
}