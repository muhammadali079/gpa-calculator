import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_cal/utils/modes.dart';

class GoalCalculatorScreen extends StatefulWidget {
  @override
  _GoalCalculatorScreenState createState() => _GoalCalculatorScreenState();
}

class _GoalCalculatorScreenState extends State<GoalCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _currentCgpaController = TextEditingController();
  final _currentCreditHoursController = TextEditingController();
  final _goalCgpaController = TextEditingController();
  final _remainingCreditHoursController = TextEditingController();

  double _requiredSGPA = 0.0;
  int totalDegreeCredits = 133;
  int maxCurrentCredits = 130;

  @override
  void initState() {
    super.initState();
    _currentCreditHoursController.addListener(updateRemainingCreditHours);
  }

  void updateRemainingCreditHours() {
    int currentCredits = int.tryParse(_currentCreditHoursController.text) ?? 0;
    int remainingMax = totalDegreeCredits - currentCredits;
    setState(() {
      _remainingCreditHoursController.text = remainingMax.toString();
    });
  }

  final List<String> _customPharses = [
    "like trying to go back in time in and change your grades — even altering history can't fix this mess!",
    "it's a pointless struggle, like trying to fix something that's already broken beyond repair.",
    "like trying to create a paradox — even if you went back in time and changed your grades, your CGPA would still loop back to where it started!",
    "It's like digging for water in a desert, each effort sinking you deeper into academic despair",
    "like wandering through a maze with no exit—each turn leads to another dead end, lost in academic frustration.",
  ];
  String _message = '';
  String _myMessage(double currentCGPA, double goalCGPA, double requiredSGPA) {
    Random random = Random();
    int index = random.nextInt(_customPharses.length);
    String phrase = _customPharses[index];
    return "Sigh... attempting to boost your CGPA is like wishing for a ${requiredSGPA.toStringAsFixed(2)} SGPA.. — $phrase";
  }

  void _calculateRequiredSGPA() {
    double currentCgpa = double.tryParse(_currentCgpaController.text) ?? 0.0;
    int currentCreditHours =
        int.tryParse(_currentCreditHoursController.text) ?? 0;
    double goalCgpa = double.tryParse(_goalCgpaController.text) ?? 0.0;
    int remainingCreditHours =
        int.tryParse(_remainingCreditHoursController.text) ?? 0;

    int totalCreditHours = currentCreditHours + remainingCreditHours;
    double totalQualityPoints =
        (goalCgpa * totalCreditHours) - (currentCgpa * currentCreditHours);
    _requiredSGPA = totalQualityPoints / remainingCreditHours;
    if (_requiredSGPA > 4.0) {
      setState(() {
        _message = _myMessage(currentCgpa, goalCgpa, _requiredSGPA);
        _requiredSGPA = 0.0;
      });
    } else {
      setState(() {
        _message = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = isDarkMode(context) ? Colors.white : Colors.black;
       double width = MediaQuery.of(context).size.width;
double maxWidth = width > 600 ? (width * 0.7) : width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: maxWidth,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("GOAL CGPA CALCULATOR", textAlign: TextAlign.center),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor:
                              isDarkMode(context) ? Colors.white : Colors.black,
                          controller: _currentCreditHoursController,
                          decoration: InputDecoration(
                            labelText: 'Current Credit Hours',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(?:[1-9]?[0-9]|1[0-2][0-9]|130)$')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your current credit hours';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            updateRemainingCreditHours();
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          cursorColor:
                              isDarkMode(context) ? Colors.white : Colors.black,
                          controller: _currentCgpaController,
                          decoration: InputDecoration(
                            labelText: 'Current CGPA',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                            ),
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-3](\.[0-9]{0,2})?|^4(\.0{0,2})?$')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your current CGPA';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor:
                              isDarkMode(context) ? Colors.white : Colors.black,
                          controller: _remainingCreditHoursController,
                          decoration: InputDecoration(
                            labelText: 'Remaining Credit Hours',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^(?:[1-9][0-9]?|1[0-2][0-9]|130)$')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your remaining credit hours';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          cursorColor:
                              isDarkMode(context) ? Colors.white : Colors.black,
                          controller: _goalCgpaController,
                          decoration: InputDecoration(
                            labelText: 'Goal CGPA',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                            ),
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-3](\.[0-9]{0,2})?|^4(\.0{0,2})?$')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your goal CGPA';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculateRequiredSGPA();
                      }
                    },
                    child: Text('Calculate Required SGPA'),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      _requiredSGPA > 0
                          ? 'Required SGPA: ${_requiredSGPA.toStringAsFixed(2)}'
                          : _message,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 22, 22),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
