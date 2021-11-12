import 'package:flutter/material.dart';
import 'package:nginie/model/models/Activity.dart';
import 'package:nginie/view/Activities/new_activity_screen.dart';
import 'package:nginie/view/widgets/loading_widget.dart';
import 'package:nginie/view_models/activity_view_model.dart';
import 'package:provider/src/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ActivityViewModel activityViewModel = context.watch<ActivityViewModel>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(activityViewModel),
          ],
        ),
      ),
    );

  }
  _ui(ActivityViewModel activityViewModel){
    if(activityViewModel.loading){
      return Container(
        child: LoadingWidget(),
      );
    }
    if(activityViewModel.activityError != null) {
      return Expanded(
        child: ErrorWidget.withDetails(
          message: activityViewModel.activityError!.message,
        ),
      );
    }
    return Expanded(child: ListView.separated(
        itemBuilder: (context, index){
          Activity activity = activityViewModel.activityListModel[index];
          return Container(
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(activity.image),
              ),
              title: Text(activity.name),
              subtitle: Text(activity.desc),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: activityViewModel.activityListModel.length)
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Activities"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewActivityScreen()));
          },
        ),
      ],
    );
  }

}
