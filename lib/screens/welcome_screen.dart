import 'package:flutter/material.dart';
import 'package:mr_study/screens/tabs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: ElevatedButton(child: Text('login'), onPressed: () {
        Navigator.pushNamed(context, TabsScreen.id);
      },)
    );
  }
}
