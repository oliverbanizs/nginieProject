import 'package:flutter/material.dart';
import 'package:nginie/model/api/api_status.dart';
import 'package:nginie/model/models/Activity.dart';
import 'package:nginie/model/repositories/activity_repo.dart';

class ActivityViewModel extends ChangeNotifier {

  bool _loading = false;
  List<Activity> _activityListModel = [];
  ActivityError? _activityError;


  bool get loading => _loading;
  List<Activity> get activityListModel => _activityListModel;
  ActivityError? get activityError => _activityError;

  ActivityViewModel() {
    getActivity();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setActivityListModel(List<Activity> activityListModel) {
    _activityListModel = activityListModel;
  }

  setActivityError(ActivityError activityError) {
    _activityError = activityError;
  }

  getActivity() async {
    setLoading(true);
    var response = await ActivityRepository.getActivity();
    if (response is Success) {
      setActivityListModel(response.response as List<Activity>);
    }
    if (response is Failure) {
      ActivityError activityError = ActivityError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setActivityError(activityError);
    }
    setLoading(false);
  }
}
