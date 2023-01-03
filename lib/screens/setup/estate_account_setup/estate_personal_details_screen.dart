import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/colors.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_personal_details_form.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/size_model.dart';

class EstatePersonalDetailsScreen extends StatefulWidget {
  const EstatePersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _EstatePersonalDetailsScreenState createState() => _EstatePersonalDetailsScreenState();
}

class _EstatePersonalDetailsScreenState extends State<EstatePersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: Center(
                        child: FAProgressBar(
                          currentValue: 85,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: AppColors.defaultBlue,
                          size: 9,
                        )),
                  ),
                  SizedBox(height: 10,),
                  SvgPicture.asset(AssetsPath.formPersonalInfo, height: 60),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text('Enter Personal Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text("Let's get to know you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EstatePersonalDetailsForm()
                ],
              ),
            ),
          ),
        ));
  }
}
