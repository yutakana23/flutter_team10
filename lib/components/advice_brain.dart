import '../components/advice.dart';

class AdviceBrain {
  List<Advice> _adviceList = [
    Advice(subject: '物理', unit: '力学', advice: '「力の働く運動」分野の問題が苦手なようです。公式をしっかりと覚えて、活用できるようにしましょう。力学は図を書くことでわかりやすくなります。'),
    Advice(subject: '物理', unit: '波動', advice: '「光の反射と屈折」の分野が苦手なようです。全反射の条件や屈折率の違う媒質に入った時の光の進路を中心に勉強してください。')
  ];
  
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
