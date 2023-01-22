import 'package:flutter/widgets.dart';

import '../models/user_model.dart';
import '../util/api.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> _invited = [];
  List<UserModel> get get => _users;
  List<UserModel> get invited => _invited;
  bool loading = false;

  Future<void> fetch(String workspaceId, String token,
      {bool state = false}) async {
    loading = true;
    var res = await Api.getData(
        'account-api/workspaces/${workspaceId}/members?pending=${state}&offset=0&limit=50');

    if (!state) {
      _users = [];
      res!['results'].forEach((v) {
        _users.add(UserModel.fromJson(v));
      });
    } else {
      _invited = [];
      res!['results'].forEach((v) {
        _invited.add(UserModel.fromJson(v));
      });
    }

    loading = false;
    notifyListeners();
  }
}
