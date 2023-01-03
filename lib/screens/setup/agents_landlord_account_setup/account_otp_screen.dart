import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../util/strings.dart';
import '../../../widgets/custom_dividers.dart';
import 'account_password_screen.dart';
import 'components/forms/account_otp_form.dart';


class AccountOTPScreen extends StatefulWidget {
  final String optionSelected;
  const AccountOTPScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountOTPScreenState createState() => _AccountOTPScreenState();
}

class _AccountOTPScreenState extends State<AccountOTPScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                child: Center(
                    child: FAProgressBar(
                      currentValue: 60,
                      backgroundColor: const Color(0xffE3E6E8),
                      progressColor: AppColors.defaultBlue,
                      size: 9,
                    )),
              ),
              SvgPicture.asset(AssetsPath.formVerify, height: 60,),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                width: 250,
                child: Text('Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text("We’ve sent a verification code to johndoe@mail.com", textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        //buildTimer(),
                        const AccountOTPForm(),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Didn’t receive a mail?",
                                style: TextStyle(
                                    fontSize: Sizes.w15)),
                            customVerticalDivider(),

                            GestureDetector(
                              onTap: () {
                                // OTP code resend
                              },
                              child: const Text(
                                resendTxt,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // OTP code resend
                              },
                              child: const Text(
                                  "Change email", style: TextStyle(
                                color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w800, )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8, top: 8),
                          child: ButtonWidgets().customButton(
                              context: context,
                              function: proceed,
                              buttonText: verifyTxt,
                              buttonHeight: Sizes.h50,
                              buttonColor: AppColors.defaultBlue),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.05),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPwdScreen(optionSelected: widget.optionSelected,))
    );
  }




  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
