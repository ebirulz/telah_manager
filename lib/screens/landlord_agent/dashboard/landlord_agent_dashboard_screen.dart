import 'package:flutter/material.dart';

import '../../../util/size_model.dart';
import 'model/dashboard_model.dart';
import 'tabs/dashboard_tab.dart';
import 'tabs/notifications_tab.dart';
import 'tabs/messages_tab.dart';
import 'package:iconsax/iconsax.dart';

class LandlordAgentDashboard extends StatefulWidget {
  const LandlordAgentDashboard({Key? key}) : super(key: key);

  @override
  State<LandlordAgentDashboard> createState() => _LandlordAgentDashboardState();
}

class _LandlordAgentDashboardState extends State<LandlordAgentDashboard> {
  int _currentIndex = 0;
  List<BottomNav> bottomNav = [
    BottomNav(iconPath: Iconsax.category, name: 'Home'),
    BottomNav(iconPath: Iconsax.notification, name: 'Notifications'),
    BottomNav(iconPath: Iconsax.sms, name: 'Messages'),
    BottomNav(iconPath: Iconsax.menu, name: 'More'),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    List screens = [
      const DashboardTab(),
      const NotificationsTab(),
      const MessagesTab(),
    ];
    return SafeArea(
      child: Scaffold(

        bottomNavigationBar: BottomNavigationBar(
            iconSize: Sizes.w30,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.grey),
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index == 3) {
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            items: bottomNav
                .map((data) => BottomNavigationBarItem(
                      icon: Icon(data.iconPath!),
                    label: data.name))
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
