import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_buttons.dart';
import 'account_created_screen.dart';
import 'components/forms/account_password_form.dart';

class AccountPwdScreen extends StatefulWidget {
  final String optionSelected;
  const AccountPwdScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountPwdScreenState createState() => _AccountPwdScreenState();
}

class _AccountPwdScreenState extends State<AccountPwdScreen> {



  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                      child: Center(
                          child: FAProgressBar(
                            currentValue: 95,
                            backgroundColor: const Color(0xffE3E6E8),
                            progressColor: AppColors.defaultBlue,
                            size: 9,
                          )),
                    ),
                    SvgPicture.asset(AssetsPath.formPassword, height: 60,),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          )),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      //width: 250,
                      child:
                      Text('Set your password, make it difficult to guess',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AccountPasswordForm(optionSelected: widget.optionSelected),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: AppColors.defaultBlue),
              ).paddingOnly(bottom: 20, right: 10, left: 10),
            ],
          ),
        ));
  }
  proceed() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountCreatedScreen())
      );
  }
}