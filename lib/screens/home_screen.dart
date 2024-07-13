import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/course_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> containers = [
    CourseContainer(),
    CourseContainer(),
    CourseContainer(),
  ];
  double CGPA = 0.0;
  void CumulativeGPA() {
    double SGPA = 0.0;
    int Totalcredithours = 0;
    for (int i = 0; i < containers.length; i++) {
      if (containers[i] is CourseContainer) {
        CourseContainer courseContainer = containers[i] as CourseContainer;
        SGPA += courseContainer.calculateGPA();
        Totalcredithours += courseContainer.creditHour;
      }
    }
    CGPA = SGPA / Totalcredithours;
    CGPA = double.parse(CGPA.toStringAsFixed(2));
    print('CGPA is $CGPA');
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Center(
          child: Text('CGPA $CGPA'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: containers,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      containers.add(CourseContainer());
                    });
                  },
                  child: Text(
                    'Add more',
                    style: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                         CumulativeGPA();  
                    });
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}