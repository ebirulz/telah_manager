import 'package:flutter/material.dart';
import 'widget/notification_widgets.dart';

import '../../../widgets/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Notifications',),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          Text("Today", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          NotificationListCard(
            context,
            message: 'John Doe added you as an admin',
            estate_name: 'Sage Estates, Abuja',
            date: '4:35pm',
          ),
          NotificationListCard(
            context,
            message: 'John Doe added you as an admin',
            estate_name: 'Sage Estates, Abuja',
            date: '4:35pm',
          ),
          SizedBox(height: 10,),
          Text("Yesterday", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          NotificationListCard(
            context,
            message: 'John Doe added you as an admin',
            estate_name: 'Sage Estates, Abuja',
            date: '4:35pm',
          ),
          NotificationListCard(
            context,
            message: 'John Doe added you as an admin',
            estate_name: 'Sage Estates, Abuja',
            date: '4:35pm',
          ),
        ],
      ),
    );
  }
}
