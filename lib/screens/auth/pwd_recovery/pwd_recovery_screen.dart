import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/screens/auth/pwd_recovery/pwd_otp_screen.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import 'package:manager/widgets/app_bar.dart';
import 'form/pwd_recovery_form.dart';

class PwdRecoveryScreen extends StatefulWidget {
  const PwdRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PwdRecoveryScreen> createState() => _PwdRecoveryScreenState();
}

class _PwdRecoveryScreenState extends State<PwdRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                      SvgPicture.asset(AssetsPath.markedEnvelopIcon, height: 70),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        width: 250,
                        child: Text(forgotTitleTxt,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 23,
                            )),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(forgotDescTxt, textAlign: TextAlign.center),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      PwdRecoveryForm()
                    ],
                  ),
                ),
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
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PwdOTPScreen())
    );
  }
}