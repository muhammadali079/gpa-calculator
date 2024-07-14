import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        labelText: 'Enter Course Name',
        hintText: 'Programming Fundamentals',
        border: OutlineInputBorder(),
      ),
      controller: _controller,
      onChanged: onChanged,
    );
  }
}
