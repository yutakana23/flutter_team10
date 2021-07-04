import 'package:flutter/material.dart';
import 'package:mr_study/main.dart';
import 'package:mr_study/screens/exams_screen.dart';
import 'package:mr_study/screens/settings_screen.dart';
import 'package:mr_study/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'tabs_screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with SingleTickerProviderStateMixin {
  final List<TabInfo> _tabs = [
    TabInfo('タスク', TasksScreen(), Icon(Icons.check_box)),
    TabInfo('模試結果', ExamsScreen(), Icon(Icons.show_chart)),
    TabInfo('設定', SettingsScreen(), Icon(Icons.settings)),
  ];

  int _tabIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<ProvidedData>(context).appBarTitle ?? _tabs[_tabIndex].label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
        bottom: Provider.of<ProvidedData>(context).showingTabs ? TabBar(
          tabs: _tabs.map((tab) => Tab(icon: tab.icon,)).toList(),
          isScrollable: false,
          controller: _tabController,
        ) : null,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) => tab.widget).toList(),
      ),
    );
  }
}

class TabInfo {
  final String label;
  final Widget widget;
  final Icon icon;
  TabInfo(this.label, this.widget, this.icon);
}
