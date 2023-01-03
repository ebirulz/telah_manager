import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manager/network/server_config.dart';
import '../models/login/login_response.dart';

class FetchData {

  static Future<LoginResponse?> login(Map<String, dynamic> request) async {
    try {
      http.Response response = await http.post(Uri.parse(ServerConfig.LOGIN), headers: {'content-type' : 'application/json'}, body: jsonEncode(request));
      if (response.statusCode == 200) {
        return loginResponseFromJson(response.body);
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