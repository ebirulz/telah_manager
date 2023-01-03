import 'package:flutter/material.dart';

import '../../../../../util/assets.dart';
import '../../../../../util/decor.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/app_bar.dart';
import '../../../../../widgets/custom_buttons.dart';
import '../../../../../widgets/custom_dividers.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  TextEditingController addservice = TextEditingController();
  List<String> addedservices = [];
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
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: .4,
                  ),
                  customDivider(height: Sizes.h50),
                  Center(
                    child: Image.asset(
                      AssetsPath.services,
                      width: Sizes.w70,
                    ),
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'What services do you provide?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: Sizes.w15),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'E.g. Sanitation, Security, Waste Disposal, \nStreet lighting etc.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.green,
                        fontSize: Sizes.w15),
                  ),
                  customDivider(height: Sizes.h30),
                  Column(
                    children: addedservices
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
                                    addedservices.remove(e);
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
                    onTap: addNewService,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        customVerticalDivider(width: Sizes.w5),
                        Text(
                          'Add Services',
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
    /*Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PaymentMode()));*/
  }

  addNewService() {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add service',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                      ),
                      customDivider(height: Sizes.h25),
                      TextFormField(
                        controller: addservice,
                        style: TextStyle(fontSize: Sizes.w13),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        decoration: Decor()
                            .formDecor(context: context, labelText: 'Service'),
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
                              // ignore: prefer_is_empty
                              if (addservice.text.trim.toString().length == 0) {
                                setState(() {
                                  addedservices.add(addservice.text);
                                });
                              }
                            },
                            child: Text(
                              'Add service',
                              style: TextStyle(fontSize: Sizes.w20),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
