import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import '../../../../util/colors.dart';
import '../../../../widgets/custom_dividers.dart';
import 'add_estate_services_screen.dart';

import '../../../../util/assets.dart';
import '../../../../util/decor.dart';
import '../../../../util/size_model.dart';

class PropertyUnit extends StatefulWidget {
  const PropertyUnit({Key? key}) : super(key: key);

  @override
  State<PropertyUnit> createState() => _PropertyUnitState();
}

class _PropertyUnitState extends State<PropertyUnit> {
  TextEditingController addproperty = TextEditingController();
  List<String> addedproperty = [];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget().appbar(context: context),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h10,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: SingleChildScrollView(
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
                  customDivider(height: Sizes.h50),
                  Center(
                    child: Image.asset(
                      AssetsPath.propertyunitadd,
                      width: Sizes.w70,
                    ),
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Property unit type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'List the category of property units in \nyour estate. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: Sizes.w15),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'Eg. Bungalow, Duplex, 3 bedroom Terrace etc.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.green,
                        fontSize: Sizes.w15),
                  ),
                  customDivider(height: Sizes.h30),
                  Column(
                    children: addedproperty
                        .map((e) => Padding(
                              padding: EdgeInsets.only(bottom: Sizes.h15),
                              child: TextFormField(
                                readOnly: true,
                                initialValue: e,
                                style: TextStyle(fontSize: Sizes.w13),
                                keyboardType: TextInputType.name,
                                decoration: Decor().formDecor(
                                    context: context,
                                    suffix: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            addedproperty.remove(e);
                                          });
                                        },
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.red.withOpacity(.4),
                                          child: Center(
                                            child: ImageIcon(
                                              const AssetImage(
                                                  'assets/icons/cancel.png'),
                                              color: Colors.red,
                                              size: Sizes.w15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                  customDivider(height: Sizes.h30),
                  GestureDetector(
                    onTap: addUnitType,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        customVerticalDivider(width: Sizes.w5),
                        Text(
                          'Add property unit type',
                          style: TextStyle(
                              color: Colors.blue, fontSize: Sizes.w15),
                        )
                      ],
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
      ),
    );
  }

  proceed() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PropertyServices()));
  }

  addUnit() {
    return showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: Sizes.h300,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h30, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add property unit type',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    TextFormField(
                      controller: addproperty,
                      style: TextStyle(fontSize: Sizes.w13),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: Decor().formDecor(
                          context: context, labelText: 'Property type'),
                    ),
                    customDivider(height: Sizes.h15),
                    TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: Decor().formDecor(
                          context: context, labelText: 'Description'),
                    ),
                    customDivider(height: Sizes.h25),
                    SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: Decor().buttonDecor(context: context),
                          onPressed: () {
                            Navigator.pop(context);
                            // the paystack modal
                            if (addproperty.text.trim.toString().isEmpty) {
                            } else {
                              setState(() {
                                addedproperty.add(addproperty.text);
                              });
                            }
                          },
                          child: Text(
                            'Add property type',
                            style: TextStyle(fontSize: Sizes.w20),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  addUnitType() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: Sizes.h250,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h30, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Property Unit Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    FormBuilderTextField(
                      controller: addproperty,
                      //style: TextStyle(fontSize: Sizes.w13),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: 'Property Type',
                          suffixIcon: Icon(Iconsax.money)
                      ),
                      name: 'property_type',
                    ),
                    customDivider(height: Sizes.h25),
                    SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: Decor().buttonDecor(context: context),
                          onPressed: () {
                            Navigator.pop(context);
                            // the paystack modal
                            if (addproperty.text.trim.toString().isEmpty) {
                            } else {
                              setState(() {
                                addedproperty.add(addproperty.text);
                              });
                            }
                          },
                          child: Text(
                            'Add property type',
                            style: TextStyle(fontSize: Sizes.w20),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}