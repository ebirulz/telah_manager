import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_phone_form.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'estate_location_screen.dart';

class EstatePhoneScreen extends StatefulWidget {
  const EstatePhoneScreen({Key? key}) : super(key: key);

  @override
  _EstatePhoneScreenState createState() => _EstatePhoneScreenState();
}

class _EstatePhoneScreenState extends State<EstatePhoneScreen> {
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
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                      child: Center(
                          child: FAProgressBar(
                            currentValue: 40,
                            backgroundColor: const Color(0xffE3E6E8),
                            progressColor: AppColors.defaultBlue,
                            size: 9,
                          )),
                    ),
                    SizedBox(height: 10,),
                    SvgPicture.asset(AssetsPath.formPhone, height: 60),
                    const SizedBox(
                      width: 250,
                      child: Text('Phone Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          )),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      child:
                      Text('Enter a phone number for this Estate.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EstatePhoneForm(),
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
        MaterialPageRoute(builder: (context) => EstateLocationScreen())
    );
  }

}
