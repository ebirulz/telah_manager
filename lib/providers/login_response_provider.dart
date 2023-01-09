import 'package:flutter/material.dart';
import 'package:manager/models/login/login_response.dart';

class LoginResponseProvider extends ChangeNotifier {
  late LoginResponse _loginResponse;
  bool loading = false;

  LoginResponse get loginResponse => _loginResponse;

  void set(LoginResponse loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
}
