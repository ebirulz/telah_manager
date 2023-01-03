import 'package:flutter/material.dart';
import 'package:manager/screens/estate/property_unit/manage/form/update_property_owner_form.dart';

import '../../../../widgets/app_bar.dart';

class EditPropertyOwnerScreen extends StatefulWidget {
  const EditPropertyOwnerScreen({Key? key}) : super(key: key);

  @override
  State<EditPropertyOwnerScreen> createState() => _EditPropertyOwnerScreenState();
}

class _EditPropertyOwnerScreenState extends State<EditPropertyOwnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(
          context: context,
          title: 'Update Property Owner',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              UpdatePropertyOwnerForm()
            ],
          ),
        ),
      ),
    );
  }
}
