import 'package:flutter/material.dart';
import 'package:manager/models/debtors_model.dart';

import '../util/api.dart';

class DebtorsProvider extends ChangeNotifier {
  List<Debtors> _debtors = [];
  bool loading = false;
  int totalDebtors = 0;

  List<Debtors> get get => _debtors;

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
}
