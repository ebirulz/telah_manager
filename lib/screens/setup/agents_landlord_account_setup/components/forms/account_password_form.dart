import 'package:flutter/material.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:passwordfield/passwordfield.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../util/strings.dart';
import '../../../estate_account_setup/estate_name_screen.dart';



class AccountPasswordForm extends StatefulWidget {
  final String optionSelected;
  const AccountPasswordForm({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountPasswordFormState createState() => _AccountPasswordFormState();
}

class _AccountPasswordFormState extends State<AccountPasswordForm> {

  bool hideText = true;
  IconData visibility = Icons.visibility;

  @override
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
          SizedBox(height: 15,),


          /*Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: 8),
            child: ButtonWidgets().customButton(
                context: context,
                function: showAlertDialog,
                buttonText: proceedTxt,
                buttonHeight: Sizes.h50,
                buttonColor: AppColors.defaultBlue),
          ),*/
        ],
      ),
    );
  }
  proceed() {
    if(widget.optionSelected == "3"){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EstateNameScreen())
      );
    }
    else{
      /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AgentDashboard())
      );*/
    }
  }

  showAlertDialog() {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //content: Text("This is my message."),
      content: SizedBox(
        height: 210,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/success.gif", alignment:Alignment.center, fit:BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                accountCreatedTxt,
                //style: kDarkTextStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 8, top: 8),
              child: ButtonWidgets().customButton(
                  context: context,
                  function: proceed,
                  buttonText: "Continue",
                  buttonHeight: Sizes.h50,
                  buttonColor: AppColors.defaultBlue),
            ),
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}