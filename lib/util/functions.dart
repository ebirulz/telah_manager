import 'dart:convert';

import 'package:flutter/material.dart';

prettyPrint(Map<String, dynamic>? body) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(body);
  debugPrint(prettyprint);
}


  String getInitials(String bank_account_name) => bank_account_name.isNotEmpty
      ? bank_account_name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';