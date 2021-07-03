import 'package:flutter/material.dart';
import 'package:mr_study/screens/exams_screen.dart';
import 'package:mr_study/screens/settings_screen.dart';
import 'package:mr_study/screens/tasks_screen.dart';

class TabsScreen extends StatelessWidget {
  static const String id = 'tabs_screen';

  final List<TabInfo> _tabs = [
    TabInfo('tasks', TasksScreen()),
    TabInfo('exam', ExamsScreen()),
    TabInfo('settings', SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('title'),
          bottom: TabBar(
            tabs: _tabs.map((tab) => Tab(text: tab.label)).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabs.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }
}

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}
