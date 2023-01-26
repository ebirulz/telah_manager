import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../models/user_model.dart';
import '../util/api.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> _invited = [];
  List _roles = [];
  bool loading = false;
  bool roles_loading = false;


  List<UserModel> get get => _users;
  List<UserModel> get invited => _invited;
  List get roles => _roles;

  Future<void> fetch(String workspaceId, {bool state = false}) async {
    roles_loading = true;
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

    roles_loading = false;
    notifyListeners();
  }

  Future fetchRoles(String workspaceId) async {
    loading = true;
    var res = await Api.getData(
        'account-api/workspaces/${workspaceId}/roles?offset=0&limit=50');

    _roles = res!['results'];

    loading = false;
    notifyListeners();
  }

  Future<Response?> sendInvite(String workspaceId, Map<String, dynamic> data) async {
    loading = true;
    var res = await Api.postData(
        'account-api/workspaces/${workspaceId}/members', data);

    return res;

    loading = false;
    notifyListeners();
  }
}
