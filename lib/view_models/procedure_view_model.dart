import 'package:flutter/material.dart';
import 'package:nginie/model/api/api_status.dart';
import 'package:nginie/model/models/Procedure.dart';
import 'package:nginie/model/repositories/procedure_repo.dart';

class ProcedureViewModel extends ChangeNotifier {

  bool _loading = false;
  List<Procedure> _procedureListModel = [];
  ProcedureError? _procedureError;


  bool get loading => _loading;
  List<Procedure> get procedureListModel => _procedureListModel;
  ProcedureError? get procedureError => _procedureError;

  ProcedureViewModel() {
    getProcedure();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProcedureListModel(List<Procedure> procedureListModel) {
    _procedureListModel = procedureListModel;
  }

  setProcedureError(ProcedureError procedureError) {
    _procedureError = procedureError;
  }

  getProcedure() async {
    setLoading(true);
    var response = await ProcedureRepository.getProcedure();
    if (response is Success) {
      setProcedureListModel(response.response as List<Procedure>);
    }
    if (response is Failure) {
      ProcedureError procedureError = ProcedureError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setProcedureError(procedureError);
    }
    setLoading(false);
  }
}
