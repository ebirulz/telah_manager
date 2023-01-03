import 'package:flutter/material.dart';

import 'package:manager/util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_bank_details_screen.dart';

class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  int radioDefault = 1;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h50,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: .5,
                  ),
                  customDivider(height: Sizes.h50),
                  Center(
                    child: Image.asset(
                      'assets/icons/billing.png',
                      width: Sizes.w70,
                    ),
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Billing cycle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'Set billing cycle for this property',
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
          ),
        ),
      ),
    );
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
              'Daily',
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
              'Weekly',
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
              'Monthly',
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
              'Quarterly',
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
              'Bi-annually',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 6,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 6;
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

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BankDetails()));
  }
}