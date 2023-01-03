import 'package:flutter/material.dart';

import '../../../../util/size_model.dart';

class MessagesTab extends StatefulWidget {
 const MessagesTab({Key? key}) : super(key: key);

  @override
  State<MessagesTab> createState() => _MessagesTabstate();
}

class _MessagesTabstate extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Messages'),
        ),
      ),
    );
  }
}