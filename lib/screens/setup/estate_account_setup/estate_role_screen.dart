import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/Estate_role_form.dart';
import 'estate_personal_details_screen.dart';

class EstateRoleScreen extends StatefulWidget {
  const EstateRoleScreen({Key? key}) : super(key: key);

  @override
  _EstateRoleScreenState createState() => _EstateRoleScreenState();
}

class _EstateRoleScreenState extends State<EstateRoleScreen> {
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
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      child: Center(
                          child: FAProgressBar(
                            currentValue: 70,
                            backgroundColor: const Color(0xffE3E6E8),
                            progressColor: AppColors.defaultBlue,
                            size: 9,
                          )),
                    ),
                    SizedBox(height: 10,),
                    SvgPicture.asset(AssetsPath.formRole, height: 60),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('Select your role',
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
                      Text('What position do you occupy in your Estate?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EstateRoleForm()
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
        MaterialPageRoute(builder: (context) => const EstatePersonalDetailsScreen())
    );
  }
}
