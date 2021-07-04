import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> settings = {
  'name': 'しょーま',
  'region': '滋賀県',
  'public': false,
};

class SettingsScreen extends StatefulWidget {
  static const String id = 'exams_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? loggedInUser;
  Map<String, dynamic> userData = {
    'name': '',
    'region': '',
    'public': '',
    'uid': '',
  };

  void getUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
      final userSnapshot = await _firestore
          .collection('settings')
          .where('uid', isEqualTo: loggedInUser!.uid)
          .get();
      setState(() {
        userData = userSnapshot.docs[0].data();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          SettingTile(title: '名前', trailing: userData['name'] ?? ''),
          SettingTile(title: '地域', trailing: userData['region'] ?? ''),
          SettingTile(title: '志望大学', trailing: userData['college'] ?? ''),
          SettingTile(
              title: '公開', trailing: (userData['public'] ?? false).toString()),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title, trailing;
  SettingTile({
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
    );
  }
}
