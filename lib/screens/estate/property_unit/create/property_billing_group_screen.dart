import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'property_owner_screen.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';

class PropertyBillingGroupScreen extends StatefulWidget {
  const PropertyBillingGroupScreen({Key? key}) : super(key: key);

  @override
  State<PropertyBillingGroupScreen> createState() => _PropertyBillingGroupScreenState();
}

class _PropertyBillingGroupScreenState extends State<PropertyBillingGroupScreen> {
  var billingGroup;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Center(
                        child: FAProgressBar(
                          currentValue: 30,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: AppColors.defaultBlue,
                          size: 9,
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  SvgPicture.asset(AssetsPath.formHouse, height: 60,),
                  SizedBox(height: 20,),
                  const SizedBox(
                    width: 250,
                    child: Text(
                        'Property Unity Type',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        )
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text('Select the property unit type',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  SizedBox(height: 25,),
                  Form(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.stepperBg),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: AppColors.defaultBlue,
                              ),
                              child: RadioListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  title: Text(
                                    'Bungalow',
                                    style: boldTextStyle(),
                                  ),
                                  value: 'Bungalow',
                                  groupValue: billingGroup,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      billingGroup = value;
                                    });
                                  }),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.stepperBg),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: AppColors.defaultBlue,

                              ),
                              child: RadioListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  title: Text(
                                    'Duplex',
                                    style: boldTextStyle(),
                                  ),
                                  value: 'Duplex',
                                  groupValue: billingGroup,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      billingGroup = value;
                                    });
                                  }),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.stepperBg),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: AppColors.defaultBlue,

                              ),
                              child: RadioListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  title: Text(
                                    'Flat',
                                    style: boldTextStyle(),
                                  ),
                                  value: 'Flat',
                                  groupValue: billingGroup,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      billingGroup = value;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Center(
                            child: TextButton.icon(
                                onPressed: () {

                                },
                                icon: Icon(
                                  Iconsax.add,
                                  color: AppColors.defaultBlue,
                                ),
                                label: Text(
                                  'Create New Property Unit Type',
                                  style: TextStyle(
                                    color: AppColors.defaultBlue,
                                    fontSize: Sizes.w18,
                                  ),
                                )
                            ),
                          ),
                          SizedBox(height: 40,),
                          ButtonWidgets().customButton(
                              context: context,
                              function: proceed,
                              buttonHeight: Sizes.h50,
                              buttonColor: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyOwnerScreen()));
  }
}