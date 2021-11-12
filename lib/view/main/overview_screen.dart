import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nginie/view/Inbox/inbox_screen.dart';
import 'package:nginie/view/Docs/docsScreen.dart';
import 'package:nginie/utils/constants.dart';
import 'package:badges/badges.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({Key? key}) : super(key: key);

  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: contentColorLightTheme),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 15.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Badge(
                    padding: EdgeInsets.all(20),
                    badgeContent: Text('2',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    child: IconButton(
                      icon: Icon(Icons.people_alt),
                      iconSize: 150,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: contentColorLightTheme),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 15.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Badge(
                    padding: EdgeInsets.all(20),
                    badgeContent: Text('4',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    child: IconButton(
                      icon: Icon(Icons.messenger),
                      iconSize: 150,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InboxScreen()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
            children: [
              Container(
                margin: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  border: Border.all(color: contentColorLightTheme),
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(17.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1.0, 15.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Badge(
                  padding: EdgeInsets.all(20),
                  badgeContent: Text('6',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  child: IconButton(
                    icon: Icon(Icons.add_task_outlined),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/activitiesScreen', (Route<dynamic> route) => false
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  border: Border.all(color: contentColorLightTheme),
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(17.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1.0, 15.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Badge(
                  padding: EdgeInsets.all(20),
                  badgeContent: Text('8',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  child: IconButton(
                    icon: Icon(Icons.file_present),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DocsScreen()),
                      );
                    },
                  ),
                ),
              ),
            ],
            ),
            Row(
              children:<Widget> [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                  margin: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: contentColorLightTheme),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 15.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("My day",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.people_alt),
                            iconSize: 60,
                            onPressed: (){

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.messenger),
                            iconSize: 60,
                            onPressed: (){

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add_task_outlined),
                            iconSize: 60,
                            onPressed: (){

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.file_present),
                            iconSize: 60,
                            onPressed: (){

                            },
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text("Currently you have X new notifications",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Overview"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
