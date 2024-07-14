import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  bool _isDarkMode = false;
  
  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme =  ThemeData(
        
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
     
        cardColor: Colors.grey[900],
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
          secondary: Color.fromARGB(255, 255, 22, 22),
        ),
        inputDecorationTheme: const InputDecorationTheme(
           border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), 
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), 
          ),
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 22, 22)),
          hintStyle: TextStyle(color: Color(0xFF434343)),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        iconTheme:const  IconThemeData(
          color: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 255, 22, 22),
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 22, 22)),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 22, 22)),
        ),
       elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:const  Color.fromARGB(255, 142, 2, 2),
            foregroundColor: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 22, 22),
        ),
      );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }
}
