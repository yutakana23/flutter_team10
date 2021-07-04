import '../components/advice.dart';

class QuizBrain {
  List<Advice> _adviceList = [
    Advice(subject: '物理', unit: '力学', advice: 'おしい！')
  ];

  String returnAdvice(int point){
    String advice;
    if(point == 100){
      advice = '完璧です！';
    }else if(point < 100 && point > 60){
      advice = 'おしい！';
    }else{
      advice = 'がんばりましょう！';
    }
    return advice;
  }


  void addList(String subject,  int score){ //物理・点数が入力→単元・アドバイスをリストに。
    String unit = '力学'; //ここどうしよ
    String advice = returnAdvice(score);
    _adviceList.add(Advice(subject: subject, unit: unit, advice: advice));
  }


  //以下出力関数
  String getSubjectText(int num) {
    return _adviceList[num].subject;
  }

  String getUnitText(int num) {
    return _adviceList[num].unit;
  }

  String getAdviceText(int num) {
    return _adviceList[num].advice;
  }

}