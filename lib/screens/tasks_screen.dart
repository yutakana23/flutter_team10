import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Task {
  final String name;
  final String subject;
  final String area;
  bool isDone;

  Task({required this.name,
    required this.subject,
    required this.area,
    this.isDone = false});

  void _action() {
    isDone = !isDone;
  }
}

// class TaskList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskData>(
//       builder: (context, taskData, child) {
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             final task = taskData.tasks[index];
//             return TaskTile(
//               title: task.name,
//               isChecked: task.isDone,
//               checkboxCallback: (checkboxState) {
//                 taskData.updateTask(task);
//               },
//               longPressCallBack: () {
//                 taskData.deleteTask(task);
//               },
//             );
//           },
//           itemCount: taskData.taskCount,
//         );
//       }
//     );
//   }
// }

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);


  static const String id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: SuggestedTasks(),
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

const List<Entry> frame = <Entry>[
  Entry('数学', <Entry>[Entry('数と式'), Entry('2次関数'), Entry('三角比')]),
];

class SuggestedTasks extends StatefulWidget {
  @override
  SuggestedTasksState createState() => new SuggestedTasksState();
}

class SuggestedTasksState extends State<SuggestedTasks> {
  List<Task> _tasks = [
    Task(name: '問1', subject: '数学', area: '数と式'),
    Task(name: '問2', subject: '数学', area: '数と式'),
    Task(name: '問3', subject: '数学', area: '2次関数')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body:_DisplayTasks(_tasks),
    );
  }

  Widget _buildFrame(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildFrame).toList(),
    );
  }

  Widget _buildRow(Task task) {
    return Card(
        child: ListTile(
          title: Text(task.name),
          trailing: ElevatedButton(
            child: Text('button'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              print('pressed');
            },
          ),
        ));
  }

  Widget _DisplayTasks(List<Task> tasks) {
    return ListView.builder(
        itemCount: tasks.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          final Task task = tasks[i];
          return Dismissible(
              key: Key(task.name),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection dir) {
                setState(() => tasks.removeAt(i));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('done'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        setState(() => tasks.insert(i, task));
                      },
                    ),
                  ),
                );
              },
              background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.thumb_up)),
              child: ListTile(
                title: Text(task.name),
                trailing: ElevatedButton(
                  child: Text('button'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    print('pressed');
                  },
                ),
              ));
        });
  }
}
