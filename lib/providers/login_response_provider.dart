import 'package:flutter/material.dart';
import 'package:manager/models/login/login_response.dart';

class LoginResponseProvider extends ChangeNotifier {
  late LoginResponse _loginResponse;
  bool loading = false;

  Map<String, dynamic> _auth = {};
  Map<String, dynamic> get getAuth => _auth;
  void setAuth(Map<String, dynamic> auth) {
    _auth = auth;
  }

  LoginResponse get loginResponse => _loginResponse;

  void set(LoginResponse loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
}
