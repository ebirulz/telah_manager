import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../estate_otp_screen.dart';

class EstatePersonalDetailsForm extends StatefulWidget {
  const EstatePersonalDetailsForm({Key? key}) : super(key: key);

  @override
  _EstatePersonalDetailsFormState createState() => _EstatePersonalDetailsFormState();
}

class _EstatePersonalDetailsFormState extends State<EstatePersonalDetailsForm> {
  late TextEditingController fnameCtr;
  late TextEditingController lnameCtr;
  late TextEditingController emailCtr;

  @override
  void initState() {
    super.initState();
    fnameCtr = TextEditingController();
    lnameCtr = TextEditingController();
    emailCtr = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "First Name",
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Last Name",
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Email",
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
            child: SizedBox(
              height: 70,
              child: Center(
                  child: IntlPhoneField(
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: 8),
            child: ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonText: proceedTxt,
                buttonHeight: Sizes.h50,
                buttonColor: AppColors.defaultBlue),
          ),
        ],
      ),
    );
  }

  proceed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EstateOTPScreen())
    );
  }
}