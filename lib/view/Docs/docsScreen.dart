import 'package:flutter/material.dart';
import 'package:nginie/model/models/Document.dart';
import 'package:nginie/view/Docs/upload_document_screen.dart';
import 'package:nginie/view/widgets/loading_widget.dart';
import 'package:nginie/view_models/doc_view_model.dart';
import 'package:provider/provider.dart';

class DocsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DocViewModel docViewModel = context.watch<DocViewModel>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(docViewModel),
          ],
        ),
      ),
    );
  }
  _ui(DocViewModel docViewModel){
    if(docViewModel.loading){
      return Container(
        child: LoadingWidget(),
      );
    }
    if(docViewModel.docError != null) {
      return Expanded(
        child: ErrorWidget.withDetails(
          message: docViewModel.docError!.message,
        ),
      );
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context, index){
          Document document = docViewModel.docListModel[index];
          return Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  document.image
                ),
              ),
              title: Text(document.name),
              subtitle: Text(document.desc),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: docViewModel.docListModel.length)
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Documents"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDocumentScreen()));
          },
        ),
      ],
    );
  }
}
