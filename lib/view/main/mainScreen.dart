import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nginie/view/Activities/activities_screen.dart';
import 'package:nginie/view/Docs/docsScreen.dart';
import 'package:nginie/view/Inbox/inbox_screen.dart';
import 'package:nginie/view/Procedures/procedure_screen.dart';
import 'package:nginie/view/main/overview_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.people_alt), label: "Overview"),
          BottomNavigationBarItem(icon:Icon(Icons.messenger), label: "Inbox"),
          BottomNavigationBarItem(icon:Icon(Icons.add_task_outlined), label: "Activity"),
          BottomNavigationBarItem(icon:Icon(Icons.approval), label: "Procedures"),
          BottomNavigationBarItem(icon:Icon(Icons.file_present), label: "Docs"),
        ],
      ),
      tabBuilder: (context, index) {
        switch(index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: OverViewScreen());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: InboxScreen());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ActivitiesScreen());
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ProcedureScreen());
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: DocsScreen());
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: OverViewScreen());
            });
        }
      },
    );
  }
}
