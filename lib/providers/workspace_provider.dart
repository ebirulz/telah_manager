import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../network/server_config.dart';
import '../util/api.dart';

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
    return await Api.getData('account-api/workspaces/${workspaceId}');
  }

  Future<Map<String, dynamic>?> fetchPropertyUnits(
      String workspaceId, String propertyUnitId, String token) async {
    return await Api.getData(
        'property-api/workspaces/${workspaceId}/property-units?property=${propertyUnitId}&offset=0&limit=50');
  }

  Future<Map<String, dynamic>?> fetchPropertyUnit(
      String workspaceId, int propertyUnitId, String token) async {
    return await Api.getData(
        'ledger-api/workspaces/${workspaceId}/tenure-ledgers?propertyUnit=${propertyUnitId}&minimumOutstanding=0.01&offset=0&limit=50');
  }

  Future<Map<String, dynamic>?> fetchPropertyUnitTransactions(
      int propertyUnitId, String token) async {
    return await Api.getData(
        'ledger-api/property-units/${propertyUnitId}/transactions?offset=0&limit=50');
  }
}
