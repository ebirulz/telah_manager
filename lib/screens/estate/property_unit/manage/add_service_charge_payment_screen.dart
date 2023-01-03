import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';

class AddServiceChargePaymentScreen extends StatefulWidget {
  const AddServiceChargePaymentScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceChargePaymentScreen> createState() => _AddServiceChargePaymentScreenState();
}

class _AddServiceChargePaymentScreenState extends State<AddServiceChargePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(
        context: context,
        title: 'Add Service Charge',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
