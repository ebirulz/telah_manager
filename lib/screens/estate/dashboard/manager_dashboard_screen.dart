import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manager/models/login/login_response.dart';
import 'package:manager/providers/login_response_provider.dart';
import 'package:manager/screens/estate/dashboard/tabs/more_tab.dart';
import 'package:manager/screens/estate/dashboard/tabs/wallet_tab.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../util/size_model.dart';
import 'model/dashboard_model.dart';
import 'tabs/dashboard_tab.dart';
import 'tabs/users_tab.dart';
import 'tabs/properties_tab.dart';
import 'package:iconsax/iconsax.dart';

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({Key? key}) : super(key: key);

  @override
  State<ManagerDashboard> createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  int _currentIndex = 0;
  List<BottomNav> bottomNav = [
    BottomNav(iconPath: Iconsax.category, name: 'Home'),
    BottomNav(iconPath: Iconsax.home, name: 'Units'),
    BottomNav(iconPath: Iconsax.people, name: 'Users'),
    BottomNav(iconPath: Iconsax.wallet_2, name: 'Wallet'),
    BottomNav(iconPath: Iconsax.menu, name: 'More'),
  ];

  @override
  void initState() {
    super.initState();
    /* Future.delayed(Duration(seconds: 0), () async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      //print(sp.getString('login_response'));
      LoginResponse lr =
          LoginResponse.fromJson(jsonDecode(sp.getString('login_response')!));
      print(lr.displayName);
    }); */
    /* print(Provider.of<LoginResponseProvider>(context, listen: false)
        .loginResponse
        .displayName); */
  }

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    List screens = [
      const DashboardTab(),
      const PropertiesTab(),
      const UsersTab(),
      const WalletTab(),
      const MoreTab()
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            iconSize: Sizes.w25,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontSize: 12),
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index == 5) {
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            items: bottomNav
                .map((data) => BottomNavigationBarItem(
                    icon: Icon(data.iconPath!), label: data.name))
                .toList()),
        body: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: screens[_currentIndex]),
      ),
    );
  }
}
