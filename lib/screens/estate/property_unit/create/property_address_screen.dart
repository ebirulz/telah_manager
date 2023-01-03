import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../../../widgets/app_bar.dart';
import 'property_billing_group_screen.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';

class AddPropertyAddressScreen extends StatefulWidget {
  const AddPropertyAddressScreen({Key? key}) : super(key: key);

  @override
  _AddPropertyAddressScreenState createState() => _AddPropertyAddressScreenState();
}

class _AddPropertyAddressScreenState extends State<AddPropertyAddressScreen> {
  late TextEditingController houseNumber;
  late TextEditingController streetName;

  @override
  void initState() {
    super.initState();
    houseNumber = TextEditingController();
    streetName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
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
                          currentValue: 20,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: AppColors.defaultBlue,
                          size: 9,
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  SvgPicture.asset(AssetsPath.formHouse, height: 60,),
                  const SizedBox(
                    width: 250,
                    child: Text(
                        'Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        )
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text('What is the address of the property unit?',
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
                          FormBuilderTextField(
                            name: "House Number",
                            decoration: const InputDecoration(
                                labelText: 'House Number',
                            ),
                          ),
                          SizedBox(height: 10,),
                          FormBuilderTextField(
                            name: "Street Name",
                            decoration: const InputDecoration(
                                labelText: 'Street Name (Optional)',
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
        .push(MaterialPageRoute(builder: (context) => const PropertyBillingGroupScreen()));
  }
}
