import 'package:flutter/material.dart';

class CourseName extends StatefulWidget {
  final String? initialValue;
  final Function(String) onChanged;

  CourseName({required this.initialValue, required this.onChanged});

  @override
  State<CourseName> createState() => _CourseNameState();
}

class _CourseNameState extends State<CourseName> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Enter Course Name',
        hintText: 'Programming Fundamentals',
        border: OutlineInputBorder(),
      ),
      controller: _controller,
      onChanged: widget.onChanged,
    );
  }
}
