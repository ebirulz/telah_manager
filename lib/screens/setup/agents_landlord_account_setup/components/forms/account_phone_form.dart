import 'package:flutter/material.dart';
import 'package:manager/widgets/custom_buttons.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../util/strings.dart';
import '../../account_otp_screen.dart';

class AccountPhoneForm extends StatefulWidget {
  final String optionSelected;
  const AccountPhoneForm({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountPhoneFormState createState() => _AccountPhoneFormState();
}

class _AccountPhoneFormState extends State<AccountPhoneForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: 70,
              child: Center(
                child: TextField(
                  maxLines: 1,
                  onChanged: (String txt) {},
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  //cursorColor: AppTheme.getTheme().primaryColor,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      errorText: null,
                      enabledBorder: const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      prefixText: "+234",
                      suffixIcon: SizedBox(
                        height: 10,
                        child: Image.asset('assets/images/ngn.png'),
                      )
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 280,
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
        MaterialPageRoute(builder: (context) => AccountOTPScreen(optionSelected: widget.optionSelected))
    );
  }

}
