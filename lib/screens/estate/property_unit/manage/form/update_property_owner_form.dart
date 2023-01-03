import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_buttons.dart';

class UpdatePropertyOwnerForm extends StatefulWidget {
  const UpdatePropertyOwnerForm({Key? key}) : super(key: key);

  @override
  State<UpdatePropertyOwnerForm> createState() => _UpdatePropertyOwnerFormState();
}

class _UpdatePropertyOwnerFormState extends State<UpdatePropertyOwnerForm> {
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
                    name: "First Name",
                    controller: TextEditingController(text: "Samuel"),
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  FormBuilderTextField(
                    name: "Last Name",
                    controller: TextEditingController(text: "Ochai"),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10,),
                  IntlPhoneField(
                    initialCountryCode: 'NG',
                    controller: TextEditingController(text: "8034428600"),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  FormBuilderTextField(
                    name: "Email",
                    controller: TextEditingController(text: "samuel@gmail.com"),
                    decoration: const InputDecoration(
                      labelText: 'Email',
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
