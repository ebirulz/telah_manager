import 'package:flutter/cupertino.dart';

class ToDo {
  IconData? icon;
  String? title;
  String? subtitle;
  String? link;
  ToDo(this.icon, this.title, this.subtitle, this.link);
}

class BottomNav {
  IconData? iconPath;
  String? name;
  BottomNav({required this.iconPath, required this.name});
}