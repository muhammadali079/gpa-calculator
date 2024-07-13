import 'package:flutter/material.dart';
import 'package:gpa_cal/screens/home_screen.dart';

void main() {
  runApp(GPACalculator());
}

class GPACalculator extends StatelessWidget {
  @override
  GPACalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('GPA CALCULATOR'),
      ),
      body: HomeScreen(),
    ));
  }
}
