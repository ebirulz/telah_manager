import 'package:flutter/material.dart';
import 'package:manager/screens/estate/property_unit/manage/form/add_property_service_charge_form.dart';

import '../../../../widgets/app_bar.dart';

class AddPropertyServiceChargeScreen extends StatefulWidget {
  const AddPropertyServiceChargeScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyServiceChargeScreen> createState() => _AddPropertyServiceChargeScreenState();
}

class _AddPropertyServiceChargeScreenState extends State<AddPropertyServiceChargeScreen> {
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
              AddPropertyServiceChargeForm()
            ],
          ),
        ),
      ),
    );
  }
}
