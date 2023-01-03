import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_buttons.dart';

class AddPropertyServiceChargeForm extends StatefulWidget {
  const AddPropertyServiceChargeForm({Key? key}) : super(key: key);

  @override
  State<AddPropertyServiceChargeForm> createState() => _AddPropertyServiceChargeFormState();
}

class _AddPropertyServiceChargeFormState extends State<AddPropertyServiceChargeForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  FormBuilderTextField(
                    name: "Service",
                    decoration: const InputDecoration(
                      labelText: 'Service (Optional)',
                    ),
                  ),
                  SizedBox(height: 10,),
                  FormBuilderTextField(
                    name: "Amount",
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                  FormBuilderDateTimePicker(
                    name: "Start Date",
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                    ),
                  ),
                  FormBuilderDateTimePicker(
                    name: "End Date",
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                    ),
                  ),

                  SizedBox(height: 20,),
                  ButtonWidgets().customButton(
                      context: context,
                      function: proceed,
                      buttonText: "Save",
                      buttonHeight: Sizes.h50,
                      buttonColor: AppColors.defaultBlue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  proceed() {
    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EstateLocationScreen())
    );*/
  }
}