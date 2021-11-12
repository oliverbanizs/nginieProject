import 'package:flutter/material.dart';
import 'package:nginie/view/Activities/activities_screen.dart';
import 'package:nginie/view/Activities/new_activity_screen.dart';
import 'package:nginie/view/Docs/docsScreen.dart';
import 'package:nginie/view/Docs/upload_document_screen.dart';
import 'package:nginie/view/Inbox/inbox_screen.dart';
import 'package:nginie/view/Inbox/new_message_screen.dart';
import 'package:nginie/view/Login/loginPage.dart';
import 'package:nginie/utils/theme.dart';
import 'package:nginie/view/Procedures/procedure_screen.dart';
import 'package:nginie/view/main/mainScreen.dart';
import 'package:nginie/view/main/overview_screen.dart';
import 'package:nginie/view_models/activity_view_model.dart';
import 'package:nginie/view_models/doc_view_model.dart';
import 'package:nginie/view_models/inbox_view_model.dart';
import 'package:nginie/view_models/procedure_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DocViewModel()),
        ChangeNotifierProvider(create: (_) => InboxViewModel()),
        ChangeNotifierProvider(create: (_) => ActivityViewModel()),
        ChangeNotifierProvider(create: (_) => ProcedureViewModel()),
      ],
      child: MaterialApp(
        title: 'Nginie',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        routes: {
          "/loginScreen": (context) => LoginPage(),
          "/mainScreen": (context) => MainScreen(),
          "/overviewScreen": (context) => OverViewScreen(),
          "/inboxScreen": (context) => InboxScreen(),
          "/activitiesScreen": (context) => ActivitiesScreen(),
          "/proceduresScreen": (context) => ProcedureScreen(),
          "/docsScreen": (context) => DocsScreen(),
          "/newMessageScreen": (context) => NewMessageScreen(),
          "/newActivityScreen": (context) => NewActivityScreen(),
          "/uploadDocScreen": (context) => UploadDocumentScreen(),
        },
        initialRoute: "/loginScreen",
      ),
    );
  }
}
