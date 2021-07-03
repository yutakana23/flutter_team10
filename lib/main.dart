import 'package:flutter/material.dart';
import 'package:mr_study/screens/tabs_screen.dart';
import 'package:mr_study/screens/tasks_screen.dart';
import 'package:mr_study/screens/exams_screen.dart';
import 'package:mr_study/screens/settings_screen.dart';
import 'package:mr_study/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //全体で行うことを設定としてはじめに定義
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: TabsScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TabsScreen.id: (context) => TabsScreen(),
      },
    );
  }
}
