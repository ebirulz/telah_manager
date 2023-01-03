import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../widgets/custom_dividers.dart';
import '../addproperty/add_property_unit_details_screen.dart';

import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../util/decor.dart';


class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  String houseNum = '';
  String streetName = '';
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: .2,
                  ),
                  customDivider(height: Sizes.h50),
                  Center(
                    child: Icon(Iconsax.category, size: Sizes.w30, color: Colors.black,),
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'What is the address of the property unit?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.w18,
                      height: 1.2,
                    ),
                  ),
                  customDivider(height: Sizes.h70),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          if (value.trim().isEmpty) {
                            houseNum = '';
                          } else {
                            houseNum = value;
                          }
                        },
                        style: TextStyle(fontSize: Sizes.w13),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: Decor().formDecor(
                            context: context, labelText: 'House number'),
                      ),
                      customDivider(height: Sizes.h30),
                      TextFormField(
                        onChanged: (value) {
                          if (value.trim().isEmpty) {
                            streetName = '';
                          } else {
                            streetName = value;
                          }
                        },
                        style: TextStyle(fontSize: Sizes.w13),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: Decor().formDecor(
                            context: context,
                            labelText: 'Street name (Optional)'),
                      )
                    ],
                  )),
                  customDivider(height: Sizes.h180),
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

  proceed() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PropertyDetails()));
  }
}