import 'package:flutter/material.dart';

import '../../../util/decor.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_unit_agreement_screen.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
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
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h50,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: .6,
                    ),
                    customDivider(height: Sizes.h50),
                    Center(
                      child: Image.asset(
                        'assets/icons/bank.png',
                        width: Sizes.w70,
                      ),
                    ),
                    customDivider(height: Sizes.h20),
                    Text(
                      'Unit bank details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                    ),
                    customDivider(height: Sizes.h15),
                    Text(
                      "Enter unit's bank details",
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
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
                        textInputAction: TextInputAction.next,
                        decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Account name',
                        )),
                    customDivider(height: Sizes.h15),
                    TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Bank',
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
      ),
    );
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RentAgreement()));
  }
}