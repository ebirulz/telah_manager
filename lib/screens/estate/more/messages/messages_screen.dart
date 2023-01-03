import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Messages',),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        children: [

        ],
      ),
    );
  }
}
