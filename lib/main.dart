import 'package:flutter/material.dart';
import 'package:gpa_cal/screens/cgpa_screen.dart';
import 'package:gpa_cal/screens/sgpa_screen.dart';
import 'package:gpa_cal/screens/about_me_screen.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    SGPAScreen(),
    CGPAScreen(),
    AboutMeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
        tabs: [
          MoltenTab(
            icon: Icon(Icons.calculate),
            title: Text('SGPA'),
          ),
          MoltenTab(
            icon: Icon(Icons.calculate_outlined),
            title: Text('CGPA'),
          ),
          MoltenTab(
            icon: Icon(Icons.person),
            title: Text('About Me'),
          ),
        ],
      ),
    );
  }
}
