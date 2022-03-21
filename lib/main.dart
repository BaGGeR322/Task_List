import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/field_provider_item.dart';

import './screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FieldProviderItem(),
      child: MaterialApp(
        title: 'Task List',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 229, 229, 229),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            primaryContainer: Colors.white,
            secondary: Colors.white,
            outline: const Color.fromARGB(255, 235, 235, 235),
            shadow: const Color.fromRGBO(44, 44, 44, 0.05),
            tertiary: const Color.fromARGB(255, 242, 243, 255),
            onTertiary: const Color.fromARGB(255, 87, 87, 103),
          ),
          textTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 56,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter',
            ),
            subtitle2: TextStyle(
              color: Color.fromARGB(255, 87, 87, 103),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
            subtitle1: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 218, 218, 218),
          ),
          dividerTheme: const DividerThemeData(
            color: Color.fromARGB(255, 235, 235, 235),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            primaryContainer: const Color.fromARGB(255, 30, 31, 37),
            secondary: Colors.white,
            outline: const Color.fromARGB(255, 41, 41, 47),
            shadow: const Color.fromRGBO(180, 180, 180, 0.05),
            tertiary: const Color.fromARGB(255, 36, 36, 45),
            onTertiary: const Color.fromARGB(255, 87, 87, 103),
          ),
          textTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter',
            ),
            subtitle2: TextStyle(
              color: Color.fromARGB(255, 218, 218, 218),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
            subtitle1: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 14, 14, 17),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
          ),
          dividerTheme: const DividerThemeData(
            color: Color.fromARGB(255, 41, 41, 47),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
