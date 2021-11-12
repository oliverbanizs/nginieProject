import 'package:flutter/material.dart';
import 'package:nginie/model/models/Procedure.dart';
import 'package:nginie/view/widgets/loading_widget.dart';
import 'package:nginie/view_models/procedure_view_model.dart';
import 'package:provider/provider.dart';

class ProcedureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProcedureViewModel procedureViewModel = context.watch<ProcedureViewModel>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(procedureViewModel),
          ],
        ),
      ),
    );
  }
  _ui(ProcedureViewModel procedureViewModel){
    if(procedureViewModel.loading){
      return Container(
        child: LoadingWidget(),
      );
    }
    if(procedureViewModel.procedureError != null) {
      return Expanded(
        child: ErrorWidget.withDetails(
          message: procedureViewModel.procedureError!.message,
        ),
      );
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context, index){
          Procedure procedure = procedureViewModel.procedureListModel[index];
          return Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(procedure.image),
              ),
              title: Text(procedure.name),
              subtitle: Text(procedure.desc),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: procedureViewModel.procedureListModel.length)
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Procedures"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => NewProcedureScreen()));
          },
        ),
      ],
    );
  }
}


