import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../../../util/colors.dart';
import '../../../../widgets/custom_dividers.dart';
import 'add_estate_service_charge_screen.dart';

import '../../../../util/assets.dart';
import '../../../../util/size_model.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key? key}) : super(key: key);

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  int radioDefault = 1;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context),
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                  child: FAProgressBar(
                    currentValue: 50,
                    backgroundColor: const Color(0xffE3E6E8),
                    progressColor: AppColors.defaultBlue,
                    size: 9,
                  )
              ),
            ),
            customDivider(height: Sizes.h30),
            Center(
              child: Image.asset(
                AssetsPath.paymentmode,
                width: Sizes.w70,
              ),
            ),
            customDivider(height: Sizes.h20),
            Text(
              'Billing Cycle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.w25),
            ),
            customDivider(height: Sizes.h15),
            Text(
              'How do you want your residents to pay their service charge',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Sizes.w18,
                height: 1.2,
              ),
            ),
            customDivider(height: Sizes.h15),
            Text(
              'Please, kindly choose a payment frequency',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Sizes.w18,
                height: 1.2,
              ),
            ),
            customDivider(height: Sizes.h30),
            bills(),
            customDivider(height: Sizes.h50),
            ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonHeight: Sizes.h50,
                buttonColor: Colors.blue),
          ],

        ),
      ),
    );
  }

  proceed() {
     Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ServiceCharge()));
  }
  bills() {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 1;
                  });
                }),
            Text(
              'Weekly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 2;
                  });
                }),
            Text(
              'Monthly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 3,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 3;
                  });
                }),
            Text(
              'Quarterly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 4,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 4;
                  });
                }),
            Text(
              'Bi-annually',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 5,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 5;
                  });
                }),
            Text(
              'Annually',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
      ],
    );
  }
}