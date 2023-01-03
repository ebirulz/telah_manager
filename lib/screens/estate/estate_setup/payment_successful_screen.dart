import 'package:flutter/material.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../../util/assets.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_estate_details/add_estate_property_unit_screen.dart';

class EstatePaymentSuccessfulScreen extends StatefulWidget {
  const EstatePaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<EstatePaymentSuccessfulScreen> createState() => _EstatePaymentSuccessfulScreenState();
}

class _EstatePaymentSuccessfulScreenState extends State<EstatePaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context, title: 'Account set up'),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s help you set-up your account!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Please answer the questions on the next screens',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h45),
                Center(
                  child: Image.asset(
                    AssetsPath.houseproperty,
                    height: Sizes.h300,
                    // width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h50),
                ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyUnit()));
  }
}
