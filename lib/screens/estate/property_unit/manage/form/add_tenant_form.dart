import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_buttons.dart';

class AddTenantForm extends StatefulWidget {
  const AddTenantForm({Key? key}) : super(key: key);

  @override
  State<AddTenantForm> createState() => _AddTenantFormState();
}

class _AddTenantFormState extends State<AddTenantForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  var titleOptions = ['Mr', 'Mrs', 'Miss', 'Dr', 'Prof', 'Alhaji', 'Sen', 'Gov'];
  var serviceChargePercentage = ['5%', '10%', '15%', '20%', '25%', '30%', '35%', '40%'];
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
                  FormBuilderDropdown<String>(
                    // autovalidate: true,
                    name: 'title',
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    allowClear: true,
                    hint: const Text('Select Title'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: titleOptions
                        .map((title) => DropdownMenuItem(
                      //alignment: AlignmentDirectional.center,
                      value: title,
                      child: Text(title),
                    ))
                        .toList(),
                    valueTransformer: (val) => val?.toString(),
                  ),
                  FormBuilderTextField(
                    name: "First Name",
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  FormBuilderTextField(
                    name: "Last Name",
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  FormBuilderDropdown<String>(
                    // autovalidate: true,
                    name: 'Service Charge Percentage',
                    decoration: InputDecoration(
                      labelText: 'Service Charge Percentage',
                    ),
                    allowClear: true,
                    hint: const Text('Select Percentage'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: serviceChargePercentage
                        .map((servicecharge) => DropdownMenuItem(
                      //alignment: AlignmentDirectional.center,
                      value: servicecharge,
                      child: Text(servicecharge),
                    ))
                        .toList(),
                    valueTransformer: (val) => val?.toString(),
                  ),
                  SizedBox(height: 10,),
                  IntlPhoneField(
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  FormBuilderTextField(
                    name: "Email",
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  FormBuilderDateTimePicker(
                      name: 'move-in-date',
                    decoration: const InputDecoration(
                      labelText: 'Move-in Date',
                    ),
                  ),
                  SizedBox(height: 20,),
                  ButtonWidgets().customButton(
                      context: context,
                      function: proceed,
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
