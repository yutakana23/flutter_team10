import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mr_study/components/rounded_button.dart';
import 'package:mr_study/constants.dart';
import 'package:mr_study/screens/tabs_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'input_profile_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  FirebaseAuth? _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userData = {
    'name': '',
    'email': '',
    'password': '',
    'region': '',
    'college': '',
    'public': false,
    'consent': false,
  };

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
                '情報の登録',
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
                  setState(() {
                    userData['name'] = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(hintText: '名前'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    userData['email'] = value;
                  });
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
                  setState(() {
                    userData['password'] = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'パスワード'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    userData['region'] = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(hintText: '地域'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    userData['college'] = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(hintText: '志望校'),
              ),
              SizedBox(
                height: 8.0,
              ),
              SwitchListTile(
                title: Text(
                  'プロフィールの公開',
                  style: TextStyle(fontSize: 18),
                ),
                value: userData['public'],
                onChanged: (value) {
                  setState(() {
                    userData['public'] = value;
                  });
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              SwitchListTile(
                title: Text(
                  '情報の統計的利用への同意',
                  style: TextStyle(fontSize: 18),
                ),
                value: userData['consent'],
                onChanged: (value) {
                  setState(() {
                    userData['consent'] = value;
                  });
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              RoundedButton(
                title: '登録',
                color: Colors.blueAccent,
                enable: _auth != null &&
                    userData['email'] != '' &&
                    userData['password'] != '' &&
                    userData['name'] != '' &&
                    userData['region'] != '' &&
                    userData['college'] != '' &&
                    userData['consent'],
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final userCredential = await _auth!.createUserWithEmailAndPassword(
                        email: userData['email']!,
                        password: userData['password']!);
                    if (userCredential.user != null) {
                      userData['uid'] = userCredential.user!.uid;
                      print(userData['uid']);
                      _firestore.collection('settings').add(userData);
                      Navigator.pushNamed(context, TabsScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
