import 'package:flutter/material.dart';

Map<String, String> settings = {
  '名前': 'しょーま',
  '地域': '滋賀県',
  '科目': '数学',
  '公開範囲': '友達まで',
};

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String id = 'exams_screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(child: Text('data'), color: Colors.red,),
        ],
      ),
    );
  }
}

// class SettingTile extends StatelessWidget {

//   final String title, trailing;
//   SettingTile({
//     required this.title, 
//     required this.trailing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       trailing: Text(trailing),
//     );
//   }
// }
