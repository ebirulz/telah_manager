import 'package:flutter/material.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/decor.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/app_bar.dart';
import '../../../../../widgets/custom_buttons.dart';
import '../../../../../widgets/custom_dividers.dart';

class ChangePwdScreen extends StatefulWidget {
  const ChangePwdScreen({Key? key}) : super(key: key);

  @override
  State<ChangePwdScreen> createState() => _ChangePwdScreenState();
}

class _ChangePwdScreenState extends State<ChangePwdScreen> {
  bool hideText = true;
  IconData visibility = Icons.visibility;
  bool hideText1 = true;
  IconData visibility1 = Icons.visibility;
  bool hideText2 = true;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar:
        AppBarWidget().appbar(context: context, title: 'Change password'),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please enter password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Current password',
                          suffix: cpSuffix())),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please enter new password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText2,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'New password',
                      )),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please confirm password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText1,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Confirm password',
                          suffix: copSuffix())),
                  customDivider(height: Sizes.h35),
                  ButtonWidgets().customButton(
                      context: context,
                      function: proceed,
                      buttonText: "Change Password",
                      buttonHeight: Sizes.h50,
                      buttonColor: AppColors.defaultBlue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  proceed(){}

  cpSuffix() {
    return IconButton(
        onPressed: () {
          if (hideText) {
            setState(() {
              hideText = false;
              visibility = Icons.visibility_off;
            });
          } else {
            setState(() {
              hideText = true;
              visibility = Icons.visibility;
            });
          }
        },
        icon: Icon(
          visibility,
          color: Colors.black54,
        ));
  }

  copSuffix() {
    return IconButton(
        onPressed: () {
          if (hideText1) {
            setState(() {
              hideText1 = false;
              visibility1 = Icons.visibility_off;
            });
          } else {
            setState(() {
              hideText1 = true;
              visibility1 = Icons.visibility;
            });
          }
        },
        icon: Icon(
          visibility1,
          color: Colors.black54,
        ));
  }

}
