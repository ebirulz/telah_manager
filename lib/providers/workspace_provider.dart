import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../network/server_config.dart';

class WorkspaceProvider extends ChangeNotifier {
  Map<String, dynamic>? _workspace = null;

  Map<String, dynamic>? get getWorkspace => _workspace;

  void setWorkspace(Map<String, dynamic>? workspace) {
    _workspace = workspace;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> fetchWorkspace(
      String workspaceId, String token) async {
    try {
      Response response = await get(
        Uri.parse(
            ServerConfig.BASE_URL + 'account-api/workspaces/${workspaceId}'),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint("ResponseStatus:: ${response.statusCode.toString()}");
        return null;
      }
    } on Exception catch (e) {
      debugPrint("LoginException:: ${e.toString()}");
      return null;
    }
  }
}
