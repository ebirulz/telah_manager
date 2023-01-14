import 'dart:convert';

import 'package:flutter/material.dart';

prettyPrint(Map<String, dynamic>? body) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(body);
  debugPrint(prettyprint);
}
