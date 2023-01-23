import 'package:flutter/material.dart';

import '../models/wallet_model.dart';
import '../util/api.dart';

class WalletProvider extends ChangeNotifier {
  late WalletModel _walletModel;
  bool loading = false;

  WalletModel get get => _walletModel;

  Future fetch(String workspaceId) async {
    loading = true;
    var res = await Api.getData('ledger-api/workspaces/${workspaceId}/wallets');

    _walletModel = WalletModel.fromJson(res[0]);

    loading = false;
    notifyListeners();
  }
}
