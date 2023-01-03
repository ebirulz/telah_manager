import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_address_screen.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  Color box1 = Colors.transparent;
  Color box2 = Colors.transparent;
  Color border1 = Colors.grey.withOpacity(.2);
  Color border2 = Colors.grey.withOpacity(.2);
  Color title1 = Colors.black;
  Color title2 = Colors.black;
  Color selectColor = Colors.blue.withOpacity(.2);
  Color titleSelect = Colors.blueAccent.withOpacity(.7);
  String optionSelected = 'Select';
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
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
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
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .1,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Icon(Iconsax.category, size: Sizes.w30, color: Colors.black,),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Property unit category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Which category is this property unit?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          optionSelected = 'commercial';
                          title1 = titleSelect;
                          box1 = selectColor;
                          border1 = selectColor;
                          title2 = Colors.black;
                          box2 = Colors.transparent;
                          border2 = Colors.grey.withOpacity(.2);
                        });
                      },
                      child: options('Commercial', box1, title1, border1),
                    ),
                    customVerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          optionSelected = 'residential';
                          title2 = titleSelect;
                          box2 = selectColor;
                          border2 = selectColor;
                          title1 = Colors.black;
                          box1 = Colors.transparent;
                          border1 = Colors.grey.withOpacity(.2);
                        });
                      },
                      child: options('Residential', box2, title2, border2),
                    )
                  ],
                ),
                customDivider(height: Sizes.h180),
                ButtonWidgets().customButton(
                    context: context,
                    function: optionSelected == 'Select' ? () {} : proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: optionSelected == 'Select'
                        ? Colors.blue.withOpacity(.4)
                        : null),
              ],
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    if (optionSelected == 'Select') {
// tell user to select
    } else {
      // continue
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AddAdress()));
    }
  }

  options(String title, Color boxColor, Color titleColor, Color borderColor) {
    return Container(
      height: Sizes.h120,
      width: Sizes.w150,
      decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.w10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/option.png',
              height: Sizes.h60,
            ),
          ),
          customDivider(height: Sizes.h15),
          Text(title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: Sizes.w15,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
