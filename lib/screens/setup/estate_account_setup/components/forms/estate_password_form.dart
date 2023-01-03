import 'package:flutter/material.dart';
import 'package:manager/screens/setup/estate_account_setup/estate_created_screen.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:passwordfield/passwordfield.dart';

import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';

class EstatePasswordForm extends StatefulWidget {
  const EstatePasswordForm({Key? key}) : super(key: key);

  @override
  _EstatePasswordFormState createState() => _EstatePasswordFormState();
}

class _EstatePasswordFormState extends State<EstatePasswordForm> {
  final TextEditingController controller = new TextEditingController();
  bool hideText = true;
  IconData visibility = Icons.visibility;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: PasswordField(
              color: Colors.blue,
              passwordConstraint: r'.*[@$#.*].*',
              inputDecoration: PasswordDecoration(),
              hintText: 'Enter Strong Password',
              errorMessage:
              'must contain special character either . * @ # \$',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: PasswordField(
              color: AppColors.defaultBlue,
              passwordConstraint: r'.*[@$#.*].*',
              inputDecoration: PasswordDecoration(),
              hintText: 'Confirm Password',
              errorMessage:
              'Password Mismatch',
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 8, top: 8),
                  child: ButtonWidgets().customButton(
                      context: context,
                      function: proceed,
                      buttonText: "Sign Up",
                      buttonHeight: Sizes.h50,
                      buttonColor: AppColors.defaultBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "By signing up, you agree to our",
                          style: TextStyle(color: AppColors.borderLine, fontSize: 12)),
                      TextSpan(
                          text: " terms of service",
                          style: TextStyle(color: AppColors.defaultBlue, fontSize: 12)),
                      TextSpan(
                          text: " and ",
                          style: TextStyle(color: AppColors.borderLine, fontSize: 12)),
                      TextSpan(
                          text: "privacy policy ",
                          style: TextStyle(color: AppColors.defaultBlue, fontSize: 12)),

                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EstateCreatedScreen())
    );
  }

}

