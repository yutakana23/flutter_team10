import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mr_study/components/rounded_button.dart';
import 'package:mr_study/constants.dart';
import 'package:mr_study/screens/registration_screen.dart';
import 'package:mr_study/screens/tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  FirebaseAuth? _auth;
  String? email;
  String? password;

  void initializeFlutterFire() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Mr. Studyへようこそ！',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'メールアドレス'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'パスワード'),
              ),
              SizedBox(
                height: 12.0,
              ),
              RoundedButton(
                title: 'ログイン',
                color: Colors.lightBlueAccent,
                enable: _auth != null,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final userCredential = await _auth!.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if (userCredential.user != null) {
                      Navigator.pushNamed(context, TabsScreen.id);
                    }

                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              RoundedButton(
                title: '新規登録 →',
                color: Colors.blueAccent,
                enable: _auth != null,
                onPressed: ()  {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
