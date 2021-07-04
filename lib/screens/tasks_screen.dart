import 'package:flutter/material.dart';
import 'package:mr_study/physics_question.dart';
import 'package:mr_study/main.dart';
import 'package:provider/provider.dart';

class Task {
  final String name;
  final String subject;
  final String area;
  bool isDone;

  Task(
      {required this.name,
      required this.subject,
      required this.area,
      this.isDone = false});

  void _action() {
    isDone = !isDone;
  }
}

List<Task> _tasks = [
  Task(name: '問1', subject: '数学', area: '数と式'),
  Task(name: '問2', subject: '数学', area: '数と式'),
  Task(name: '問3', subject: '数学', area: '2次関数'),
  Task(name: '問4', subject: '物理', area: '力学'),
  Task(name: '問5', subject: '物理', area: '力学')
];

class TasksScreen extends StatelessWidget {

  static const String id = 'Tasks_Screen';

  @override
  Widget build(BuildContext context) {
    return SuggestedTasks();
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

const List<Entry> frame = <Entry>[
  Entry('数学', <Entry>[Entry('数と式'), Entry('2次関数'), Entry('三角比')]),
  Entry('国語', <Entry>[Entry('現代文'), Entry('古文'), Entry('漢文')]),
  Entry('物理', <Entry>[Entry('力学'), Entry('電磁気')])
];

class SuggestedTasks extends StatefulWidget {
  @override
  SuggestedTasksState createState() => new SuggestedTasksState();
}

class SuggestedTasksState extends State<SuggestedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _DisplayFrame(frame),
    );
  }

  Widget _buildFrame(Entry root) {
    if (root.children.isEmpty) {
      var TasksArea = _tasks
          .where(
              (_tasks) => (_tasks.area == root.title && _tasks.isDone == false))
          .toList();
      return GestureDetector(
        onTap: () async {
          Provider.of<ProvidedData>(context, listen: false).hideTabs(TasksArea[0].area);
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextPage(TasksArea),
            ),
          );

          Provider.of<ProvidedData>(context, listen: false).showTabs();
        },
        child: ListTile(
            title: Text(root.title),
            trailing: (TasksArea.length > 0)
                ? Stack(alignment: Alignment.center, children: [
                    Icon(
                      Icons.brightness_1,
                      color: Colors.red,
                    ),
                    Text(
                      TasksArea.length.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])
                : Text('')),
      );
    }

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(
              //fontFamily: ,
              )),
      trailing: !(_tasks.every((_tasks) => !(_tasks.subject == root.title)))
          ? Icon(
              Icons.brightness_1,
              color: Colors.red,
              size: 10.0,
            )
          : Text(''),
      children: root.children.map(_buildFrame).toList(),
    );
  }

  Widget _DisplayFrame(List<Entry> frame) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          _buildFrame(frame[index]),
      itemCount: frame.length,
    );
  }
}

class NextPage extends StatefulWidget {
  NextPage(this.tasks);

  final List<Task> tasks;

  @override
  NextPageState createState() => NextPageState(tasks);
}

class NextPageState extends State<NextPage> {
  NextPageState(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tasks[0].area),
        ),
        body: Container(
          color: Colors.white,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            ListView.builder(
                itemCount: tasks.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int i) {
                  final Task task = tasks[i];
                  return CheckboxListTile(
                    title: Text(task.name),
                    value: task.isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        task.isDone = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PhysicsQuestion();
                          }));
                        },
                        child: const Text(
                          'see',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  );
                }),
            Positioned(
              bottom: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '更新',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
