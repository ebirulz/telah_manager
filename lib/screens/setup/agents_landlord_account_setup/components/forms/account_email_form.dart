import 'package:flutter/material.dart';


import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../account_phone_screen.dart';

class AccountEmailForm extends StatefulWidget {
  final String optionSelected;
  const AccountEmailForm({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountEmailFormState createState() => _AccountEmailFormState();
}

class _AccountEmailFormState extends State<AccountEmailForm> {
  late TextEditingController emailCtr;

  @override
  void initState() {
    super.initState();
    emailCtr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: 70,
              child: Center(
                /*child: CustomTextField(
                  label: "Email",
                  controller: emailCtr,
                ),*/
              ),
            ),
          ),

          const SizedBox(
            height: 250,
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
        context,
        MaterialPageRoute(builder: (context) => AccountPhoneScreen(optionSelected: widget.optionSelected))
    );
  }
}