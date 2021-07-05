import 'package:flutter/material.dart';
import 'package:mr_study/screens/registration_screen.dart';
import 'package:mr_study/screens/login_screen.dart';
import 'package:mr_study/screens/tabs_screen.dart';
import 'package:mr_study/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProvidedData>(
      create: (context) => ProvidedData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          //全体で行うことを設定としてはじめに定義
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: LoginScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          TabsScreen.id: (context) => TabsScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}

class ProvidedData extends ChangeNotifier {
  bool showingTabs = true;
  String? appBarTitle;
  
  void showTabs() {
    showingTabs = true;
    appBarTitle = null;
    notifyListeners();
  }

  void hideTabs(String title) {
    showingTabs = false;
    // appBarTitle = title;
    notifyListeners();
  }
}
