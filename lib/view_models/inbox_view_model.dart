import 'package:flutter/material.dart';
import 'package:nginie/model/api/api_status.dart';
import 'package:nginie/model/models/Inbox.dart';
import 'package:nginie/model/repositories/inbox_repo.dart';

class InboxViewModel extends ChangeNotifier{
  bool _loading = false;
  List<Inbox> _inboxListModel = [];
  InboxError? _inboxError;


  bool get loading => _loading;
  List<Inbox> get inboxListModel => _inboxListModel;
  InboxError? get inboxError => _inboxError;

  InboxViewModel() {
    getInbox();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setInboxListModel(List<Inbox> inboxListModel) {
    _inboxListModel = inboxListModel;
  }

  setInboxError(InboxError inboxError) {
    _inboxError = inboxError;
  }

  getInbox() async {
    setLoading(true);
    var response = await InboxRepository.getInbox();
    if (response is Success) {
      setInboxListModel(response.response as List<Inbox>);
    }
    if (response is Failure) {
      InboxError inboxError = InboxError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setInboxError(inboxError);
    }
    setLoading(false);
  }
}