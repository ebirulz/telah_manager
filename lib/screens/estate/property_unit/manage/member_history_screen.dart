import 'package:flutter/material.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/member_list_widget.dart';

import '../../../../widgets/app_bar.dart';

class MemberHistoryScreen extends StatefulWidget {
  const MemberHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MemberHistoryScreen> createState() => _MemberHistoryScreenState();
}

class _MemberHistoryScreenState extends State<MemberHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Member History'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MemberList(
                name: "Ebimobowei Okpongu",
                status: "Tenant",
                date: "Started on Mar 21, 2022"
            ),
            MemberList(
                name: "Samuel Ochai",
                status: "Property owner",
                date: "Registered on Mar 21, 2022"
            ),
          ],
        ),
      ),
    );
  }
}
