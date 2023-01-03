import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/assets.dart';

class MoreModel {
  Color? menuColor;
  IconData? menuIcon;
  String? img;
  String? name;
  String? link;
  MoreModel({this.img, this.name, this.link, this.menuIcon, this.menuColor});
}

List<MoreModel> MoreModelDataList() {
  List<MoreModel> list = [];
  list.add(MoreModel(menuIcon: Iconsax.people,img: AssetsPath.guestIcon, name: 'Guests', link: '/guest_list', menuColor: Color(0xFF7879F1)));
  list.add(MoreModel(menuIcon: Iconsax.money_2,img: AssetsPath.debtorsIcon, name: 'Debtors', link: '/debtors_list', menuColor: Color(0xFFEF5DA8)));
  list.add(MoreModel(menuIcon: Iconsax.category,img: AssetsPath.projectsIcon, name: 'Projects', link: '/projects_list', menuColor: Color(0xFF37D14F)));
  list.add(MoreModel(menuIcon: Iconsax.category,img: AssetsPath.projectsIcon, name: 'Services', link: '/services_list', menuColor: Color(0xFF37D14F)));
  list.add(MoreModel(menuIcon: Iconsax.sms,img: AssetsPath.messageIcon, name: 'Messages', link: '/messages', menuColor: Color(0xFFF48F31)));
  list.add(MoreModel(menuIcon: Iconsax.document_text,img: AssetsPath.incidentReportIcon, name: 'Incident Report', link: '/incident_report', menuColor: Color(0xFF38B8E0)));
  list.add(MoreModel(menuIcon: Iconsax.cloud_lightning,img: AssetsPath.analyticsIcon, name: 'Analytics', link: '/analytics', menuColor: Color(0xFF6F8FE1)));
  list.add(MoreModel(menuIcon: Iconsax.status_up,img: AssetsPath.financialReportIcon, name: 'Financial Reports', link: '/financial_report', menuColor: Color(0xFF06578E)));
  list.add(MoreModel(menuIcon: Iconsax.setting,img: AssetsPath.settingsIcon, name: 'Settings', link: '/settings', menuColor: Color(0xFF5B7C30)));
  list.add(MoreModel(menuIcon: Iconsax.logout,img: AssetsPath.logoutIcon, name: 'Log Out', link: '/logout', menuColor: Color(0xFFF43154)));
  return list;
}