import 'package:flutter/material.dart';
import 'package:nginie/view/widgets/doc_upload_form.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const DocUploadForm(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        "Upload new file",
        style: TextStyle(),
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
