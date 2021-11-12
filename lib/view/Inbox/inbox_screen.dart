import 'package:flutter/material.dart';
import 'package:nginie/model/models/Inbox.dart';
import 'package:nginie/view/Inbox/new_message_screen.dart';
import 'package:nginie/view/widgets/loading_widget.dart';
import 'package:nginie/view_models/inbox_view_model.dart';
import 'package:provider/provider.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InboxViewModel inboxViewModel = context.watch<InboxViewModel>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(inboxViewModel),
          ],
        ),
      ),
    );
  }

  _ui(InboxViewModel inboxViewModel) {
    if (inboxViewModel.loading) {
      return Container(
        child: LoadingWidget(),
      );
    }
    if (inboxViewModel.inboxError != null) {
      return Expanded(
        child: ErrorWidget.withDetails(
          message: inboxViewModel.inboxError!.message,
        ),
      );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              Inbox inbox = inboxViewModel.inboxListModel[index];
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(inbox.image),
                  ),
                  title: Text(inbox.name),
                  subtitle: Text(inbox.lastMessage),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: inboxViewModel.inboxListModel.length));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Inbox"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewMessageScreen()));
          },
        ),
      ],
    );
  }
}
