import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  static const String id = 'Exams_Screen';
  static const List<String> _subject = ['数学Ⅰ・A', '数学Ⅱ・B', '英語', '物理'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('右の選択肢から科目を選んでね',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text('　<数学>',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('グラフをここに',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 200.0,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Text('克服したい単元',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_subject[0]+':',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          Text(' 計算分野の問題が苦手なようです。これからは、グラフの活用や、式の利用などを中心に克服しましょう。',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
