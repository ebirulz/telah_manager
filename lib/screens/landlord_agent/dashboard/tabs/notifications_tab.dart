import 'package:flutter/material.dart';

import '../../../../util/size_model.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Notifications'),
        ),
      ),
    );
  }
}
