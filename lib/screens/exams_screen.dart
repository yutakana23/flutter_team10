import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../physics_question.dart';
import 'package:mr_study/components/graph_chart.dart';


class ExamsScreen extends StatelessWidget {
  static const String id = 'Exams_Screen';
  static const List<String> _subject = ['数学Ⅰ・A', '数学Ⅱ・B', '英語', '物理'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '右の選択肢から科目を選んでね',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('　<物理>',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GraphChart([
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 2.5),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                ], [
                  FlSpot(0, 4),
                  FlSpot(2.6, 4.3),
                  FlSpot(4.9, 4.6),
                  FlSpot(6.8, 5),
                  FlSpot(8, 6),
                  FlSpot(9.5, 5.3),
                  FlSpot(11, 6),
                ]),
              ),
            ),
          ),
          Container(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Container(
                      width: 200.0,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          '克服したい単元',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(_subject[3]+':',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              ElevatedButton(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.orange,
                                        Colors.orangeAccent,
                                        Colors.deepOrange,
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text('確認問題へ！'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return PhysicsQuestion();
                                  }));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('「力の働く運動」分野の問題が苦手なようです。公式をしっかりと覚えて、活用できるようにしましょう。力学は図を書くことでわかりやすくなります。',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
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
