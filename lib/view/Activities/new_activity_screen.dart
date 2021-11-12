import 'package:flutter/material.dart';
import 'package:nginie/view/widgets/activity_form.dart';


class NewActivityScreen extends StatelessWidget {
  const NewActivityScreen({Key? key}) : super(key: key);

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
      title: Text("Create new activity"
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

