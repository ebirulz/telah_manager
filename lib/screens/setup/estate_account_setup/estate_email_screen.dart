import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:manager/util/colors.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/size_model.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_email_form.dart';
import 'estate_phone_screen.dart';

class EstateEmailScreen extends StatefulWidget {
  const EstateEmailScreen({Key? key}) : super(key: key);

  @override
  _EstateEmailScreenState createState() => _EstateEmailScreenState();
}

class _EstateEmailScreenState extends State<EstateEmailScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: Center(
                          child: FAProgressBar(
                            currentValue: 20,
                            backgroundColor: const Color(0xffE3E6E8),
                            progressColor: AppColors.defaultBlue,
                            size: 9,
                          )),
                    ),
                    SizedBox(height: 10,),
                    SvgPicture.asset(AssetsPath.formEmail, height: 60),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('Primary Email',
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
                          /*Expanded(child: Text("Please provide your Estate official email account.", textAlign: TextAlign.center,)
                        ),
                        Text("Do not use your personal email"),*/
                          Expanded(child: Column(
                            children: [
                              Text("Please provide your Estate official email account."),
                              Text("Do not use your personal email", style: TextStyle(color: AppColors.errorText)),
                            ],
                          ))
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    EstateEmailForm()
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
        MaterialPageRoute(builder: (context) => EstatePhoneScreen())
    );
  }
}
