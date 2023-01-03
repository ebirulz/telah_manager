import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';

class FinancialReportScreen extends StatefulWidget {
  const FinancialReportScreen({Key? key}) : super(key: key);

  @override
  State<FinancialReportScreen> createState() => _FinancialReportScreenState();
}

class _FinancialReportScreenState extends State<FinancialReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Financial Report',),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        children: [
          
        ],
      ),
    );
  }
}
