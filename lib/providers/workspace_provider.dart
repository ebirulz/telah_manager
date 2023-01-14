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

  Map<String, dynamic> _propertyUnit = {};
  Map<String, dynamic> get propertyUnit => _propertyUnit;
  void setPropertyUnit(Map<String, dynamic> propertyUnit) {
    _propertyUnit = propertyUnit;
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

  Future<Map<String, dynamic>?> fetchPropertyUnits(
      String workspaceId, String propertyUnitId, String token) async {
    try {
      Response response = await get(
        Uri.parse(ServerConfig.BASE_URL +
            'property-api/workspaces/${workspaceId}/property-units?property=${propertyUnitId}&offset=0&limit=50'),
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

  Future<Map<String, dynamic>?> fetchPropertyUnit(
      String workspaceId, int propertyUnitId, String token) async {
    try {
      Response response = await get(
        Uri.parse(ServerConfig.BASE_URL +
            'ledger-api/workspaces/${workspaceId}/tenure-ledgers?propertyUnit=${propertyUnitId}&minimumOutstanding=0.01&offset=0&limit=50'),
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

  Future<Map<String, dynamic>?> fetchPropertyUnitTransactions(
      int propertyUnitId, String token) async {
    try {
      Response response = await get(
        Uri.parse(ServerConfig.BASE_URL +
            'ledger-api/property-units/${propertyUnitId}/transactions?offset=0&limit=50'),
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
