import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manager/widgets/custom_buttons.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../util/strings.dart';
import '../../account_otp_screen.dart';

class AccountAgentForm extends StatefulWidget {
  final String optionSelected;
  const AccountAgentForm({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountAgentFormState createState() => _AccountAgentFormState();
}

class _AccountAgentFormState extends State<AccountAgentForm> {
  late TextEditingController agentNameCtr;
  late TextEditingController fnameCtr;
  late TextEditingController lnameCtr;
  late TextEditingController emailCtr;

  @override
  void initState() {
    super.initState();
    fnameCtr = TextEditingController();
    lnameCtr = TextEditingController();
    emailCtr = TextEditingController();
    agentNameCtr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Agency Name",
              decoration: const InputDecoration(
                labelText: 'Agency Name',
              ),
            ),
          ),
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: 70,
              child: Center(
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: 20),
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
        context, MaterialPageRoute(builder: (context) =>
        AccountOTPScreen(optionSelected: widget.optionSelected))
    );
  }
}