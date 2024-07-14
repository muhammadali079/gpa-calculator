import 'package:flutter/material.dart';
import 'package:gpa_cal/utils/modes.dart';

class CourseName extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;

  CourseName({required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: initialValue);
     _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return TextField(
       cursorColor: isDarkMode(context) ? Colors.white : Colors.black,
      decoration: InputDecoration(
        labelText: 'Enter Course Name',
        hintText: 'Programming Fundamentals',
        
        border: OutlineInputBorder(),
        //  labelStyle: TextStyle(color: Colors.white), // Set the label text color to white
        // hintStyle: TextStyle(color: Color.fromARGB(254, 232, 59, 59),),
      ),
    style: TextStyle( color:isDarkMode(context) ?   Colors.white : Colors.black,), 
      controller: _controller,
      onChanged: onChanged,
    );
  }
}
