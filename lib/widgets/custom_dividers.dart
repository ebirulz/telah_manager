import 'package:flutter/material.dart';

customDivider({double? height, Color? color}) {
  return Divider(
    height: height ?? 2,
    color: color ?? Colors.transparent,
  );
}

customVerticalDivider({double? width, Color? color}) {
  return VerticalDivider(
    width: width ?? 2,
    color: color ?? Colors.transparent,
  );
}