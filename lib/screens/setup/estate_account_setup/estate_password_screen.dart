import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../util/colors.dart';
import 'components/forms/estate_password_form.dart';

class EstatePasswordScreen extends StatefulWidget {
  const EstatePasswordScreen({Key? key}) : super(key: key);

  @override
  _EstatePasswordScreenState createState() => _EstatePasswordScreenState();
}

class _EstatePasswordScreenState extends State<EstatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget().appbar(context: context,),
          body: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Column(
                children: <Widget>[
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
                  SizedBox(height: 20,),
                  SvgPicture.asset(AssetsPath.formPassword, height: 70),
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
                  EstatePasswordForm(),
                  Padding( // this is new
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
