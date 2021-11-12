import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class DocUploadForm extends StatelessWidget {
  const DocUploadForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter doc name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter doc description',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropDown<String>(
              isExpanded: true,
              items: <String>["Martin", "Mathias", "Juan"],
              icon: Icon(
                Icons.expand_more,
                color: Colors.blue,
              ),
              customWidgets: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80"
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Martin"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/5/5f/Big_Temple-Temple.jpg"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Mathias"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://raw.githubusercontent.com/rrousselGit/provider/master/resources/expanded_devtools.jpg"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Juan"),
                  ],
                )
              ],
              hint: Text("Notify..",
                style: TextStyle(fontSize: 16),
              ),
              onChanged: print,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Uploaded document',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
