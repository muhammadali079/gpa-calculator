import 'package:flutter/material.dart';

class SemesterName extends StatelessWidget {
  final String initialValue;
  final Function(String) onChanged;

  SemesterName({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: initialValue);
     _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Semester Name',
          hintText: 'Spring 2023',
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        controller: _controller,
      ),
    );
  }
}
