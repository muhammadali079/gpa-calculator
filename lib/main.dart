import 'package:flutter/material.dart';
import 'package:gpa_cal/custom_widgets/app_drawer.dart';
import 'package:gpa_cal/screens/cgpa_screen.dart';
import 'package:gpa_cal/screens/sgpa_screen.dart';
import 'package:gpa_cal/screens/goal_cgpa_screen.dart';
import 'package:gpa_cal/utils/modes.dart';
import 'package:gpa_cal/utils/theme_provider.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp(
          title: 'GPA Calculator',
          theme: themeProvider.lightTheme,
          darkTheme: themeProvider.darkTheme,
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home:const  MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    SGPAScreen(),
    CGPAScreen(),
    GoalCalculatorScreen(),
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
        title:  const Text('GPA Calculator'),
      ),
       drawer: AppDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
       barColor:   isDarkMode(context) ?  Colors.black :Colors.white ,
        domeCircleColor: isDarkMode(context) ? const Color.fromARGB(255, 142, 2, 2) : const Color.fromARGB(255, 77, 1, 118) ,
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
        tabs: [
          MoltenTab(
            icon: const  Icon(Icons.calculate),
            title: const Text('SGPA'),
          ),
          MoltenTab(
            icon: const Icon(Icons.calculate_outlined),
            title: const Text('CGPA'),
          ),
          MoltenTab(
            icon: const Icon(Icons.person),
            title:const Text('Goal CGPA'),
          ),
        ],
      ),
    );
  }
}
