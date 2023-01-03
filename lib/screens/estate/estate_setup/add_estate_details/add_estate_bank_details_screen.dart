import 'package:flutter/material.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';

import '../../../../util/assets.dart';
import '../../../../util/decor.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';
import 'add_estate_constitution_screen.dart';

class AddEstateBankDetailsScreen extends StatefulWidget {
  const AddEstateBankDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddEstateBankDetailsScreen> createState() => _AddEstateBankDetailsScreenState();
}

class _AddEstateBankDetailsScreenState extends State<AddEstateBankDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .7,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Image.asset(
                    AssetsPath.accountdetails,
                    width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Estate Bank Account Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Please provide your Estate official \n Bank Account details to receive funds',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h30),
                TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: Decor().formDecor(
                      context: context,
                      labelText: 'Bank',
                    )),
                customDivider(height: Sizes.h15),
                TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    textCapitalization: TextCapitalization.words,
                    onEditingComplete: () => node.nextFocus(),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: Decor().formDecor(
                      context: context,
                      labelText: 'Account number',
                    )),
                customDivider(height: Sizes.h15),
                TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    textCapitalization: TextCapitalization.words,
                    onEditingComplete: () => node.nextFocus(),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: Decor().formDecor(
                      context: context,
                      labelText: 'Account name',
                    )),
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
        .push(MaterialPageRoute(builder: (context) => const AddEstateConstitutionScreen()));
  }
}
