import 'package:flutter/material.dart';
import 'package:nginie/view/widgets/activity_form.dart';


class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const ActivityForm(),
    );

  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Send new message",
        style: TextStyle(
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}


