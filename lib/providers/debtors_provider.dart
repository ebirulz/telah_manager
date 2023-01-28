import 'package:flutter/material.dart';
import 'package:manager/models/debtors_model.dart';

import '../util/api.dart';

class DebtorsProvider extends ChangeNotifier {
  List<Debtors> _debtors = [];
  bool loading = false;
  int totalDebtors = 0;
  bool leadgerLoading = false;
  List<dynamic> _projects = [];
  Map<String, dynamic> _amenity = {};
  Map<String, dynamic> _project = {};

  List<Debtors> get get => _debtors;
  List<dynamic> get projects => _projects;

  Map<String, dynamic> get amenity => _amenity;
  Map<String, dynamic> get project => _project;

  Future fetch(String workspaceId) async {
    loading = true;
    var res = await Api.getData(
        'ledger-api/workspaces/${workspaceId}/tenure-ledgers?minimumOutstanding=0.01&offset=0&limit=50');

    totalDebtors = res['total'];
    _debtors =
        List<Debtors>.from(res['results'].map((val) => Debtors.fromJson(val)));

    loading = false;
    notifyListeners();
  }

  Future fetchLedgers(String workspaceId, String type) async {//type=AMENITY OR PROJECT
    leadgerLoading = true;

    var res = await Api.getData(
        'ledger-api/workspaces/${workspaceId}/ledgers?type=$type&offset=0&limit=50');

    if(type == 'AMENITY'){
      _amenity = res['results'][0];
    }else{
      _projects = res['results'];
      double totalOutstanding = 0.00;
      res['results'].forEach((x){
        totalOutstanding+=x['totalOutstanding'];
      });
      _project = {"totalOutstanding": totalOutstanding};
    }

    leadgerLoading = false;
    notifyListeners();
  }
}
