import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customPurple,
        accentColor: seaGreen,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: customPurple, // Use customPurple for buttons
            onPrimary: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
      home: TaskListView(),
    );
  }

  MaterialColor lavender = const MaterialColor(
    0xFFE6E6FA,
    <int, Color>{
      50: Color(0xFFE6E6FA),
      100: Color(0xFFE6E6FA),
      200: Color(0xFFE6E6FA),
      300: Color(0xFFE6E6FA),
      400: Color(0xFFE6E6FA),
      500: Color(0xFFE6E6FA),
      600: Color(0xFFE6E6FA),
      700: Color(0xFFE6E6FA),
      800: Color(0xFFE6E6FA),
      900: Color(0xFFE6E6FA),
    },
  );

  MaterialColor seaGreen = const MaterialColor(
    0xFF2E8B57,
    <int, Color>{
      50: Color(0xFF2E8B57),
      100: Color(0xFF2E8B57),
      200: Color(0xFF2E8B57),
      300: Color(0xFF2E8B57),
      400: Color(0xFF2E8B57),
      500: Color(0xFF2E8B57),
      600: Color(0xFF2E8B57),
      700: Color(0xFF2E8B57),
      800: Color(0xFF2E8B57),
      900: Color(0xFF2E8B57),
    },
  );
  MaterialColor customPurple = const MaterialColor(
    0xFF9370DB,
    <int, Color>{
      50: Color(0xFFE6E6FA),
      100: Color(0xFFE6E6FA),
      200: Color(0xFFE6E6FA),
      300: Color(0xFFE6E6FA),
      400: Color(0xFFE6E6FA),
      500: Color(0xFFE6E6FA),
      600: Color(0xFFE6E6FA),
      700: Color(0xFFE6E6FA),
      800: Color(0xFFE6E6FA),
      900: Color(0xFFE6E6FA),
    },
  );
}
