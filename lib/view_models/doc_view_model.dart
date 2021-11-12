import 'package:flutter/material.dart';
import 'package:nginie/model/api/api_status.dart';
import 'package:nginie/model/models/Document.dart';
import 'package:nginie/model/repositories/doc_repo.dart';

class DocViewModel extends ChangeNotifier {

  bool _loading = false;
  List<Document> _docListModel = [];
   DocError? _docError;


  bool get loading => _loading;
  List<Document> get docListModel => _docListModel;
  DocError? get docError => _docError;

  DocViewModel() {
    getDocs();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setDocListModel(List<Document> docListModel) {
    _docListModel = docListModel;
  }

  setDocError(DocError docError) {
    _docError = docError;
  }

  getDocs() async {
    setLoading(true);
    var response = await DocRepository.getDocs();
    if (response is Success) {
      setDocListModel(response.response as List<Document>);
    }
    if (response is Failure) {
      DocError docError = DocError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setDocError(docError);
    }
    setLoading(false);
  }
}
