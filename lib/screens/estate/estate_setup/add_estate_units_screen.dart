import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../../util/decor.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_dividers.dart';
import '../../../widgets/number_widget.dart';
import 'payment_successful_screen.dart';

class AddEstateUnitsScreen extends StatefulWidget {
  const AddEstateUnitsScreen({Key? key}) : super(key: key);

  @override
  State<AddEstateUnitsScreen> createState() => _AddEstateUnitsScreenState();
}

class _AddEstateUnitsScreenState extends State<AddEstateUnitsScreen> {
  int amount = 0;
  int walletAmount = 100;
  int creditAmount = 0;
  NumberWidget uw = NumberWidget();
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context,),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h10,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                        child: FAProgressBar(
                          currentValue: 10,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: AppColors.defaultBlue,
                          size: 9,
                        )
                    ),
                    customDivider(height: Sizes.h50),
                    Center(
                      child: Image.asset(
                        AssetsPath.propertymanage,
                        width: Sizes.w70,
                      ),
                    ),
                    customDivider(height: Sizes.h20),
                    Text(
                      'How many property units do you manage?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h15),
                    Text(
                      'We charge N350 monthly only per property unit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.green,
                          fontSize: Sizes.w15),
                    ),
                    customDivider(height: Sizes.h50),
                    TextFormField(
                        style: TextStyle(
                            fontSize: Sizes.w17, fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              amount = int.tryParse(value)! * 350;
                            });
                          } else {
                            setState(() {
                              amount = 0;
                            });
                          }
                        },
                      decoration: InputDecoration(
                        labelText: "Enter Number of Property Units "
                      ),
                        ),
                    customDivider(height: Sizes.h25),
                    Container(
                      height: Sizes.h50,
                      width: double.infinity,
                      decoration: Decor().container(
                          context: context,
                          borderColor: Colors.transparent,
                          color: Colors.red.withOpacity(.2)),
                      child: Center(
                        child: Text(
                          'N${uw.displayNumber(amount)}.00/Monthly',
                          style:
                          TextStyle(color: Colors.red, fontSize: Sizes.w20),
                        ),
                      ),
                    ),
                    customDivider(height: Sizes.h45),
                    Center(
                      child: Text(
                        'Wallet balance: N$walletAmount.00',
                        style:
                        TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                      ),
                    ),
                    customDivider(height: Sizes.h15),
                    Center(
                      child: Text(
                        'Credit: N$creditAmount.00',
                        style:
                        TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                      ),
                    ),
                    customDivider(height: Sizes.h60),
                    ButtonWidgets().customButton(
                        context: context,
                        function: amount == 0 ? () {} : topup,
                        buttonText: 'Subscribe',
                        buttonHeight: Sizes.h50,
                        buttonColor: amount == 0
                            ? Colors.blue.withOpacity(.4)
                            : Colors.blue),
                    customDivider(height: Sizes.h15),
                    Center(
                      child: GestureDetector(
                        onTap: addpromo,
                        child: Text(
                          'Use promo code',
                          style: TextStyle(
                              color: Colors.blue.withOpacity(.8),
                              fontSize: Sizes.w15),
                        ),
                      ),
                    ),
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
        .push(MaterialPageRoute(builder: (context) => const EstatePaymentSuccessfulScreen()));
  }

  topup() {
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Sizes.h30, left: Sizes.w15, right: Sizes.w15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top-up wallet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                      ),
                      customDivider(height: Sizes.h25),
                      TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        decoration: Decor()
                            .formDecor(context: context, labelText: 'Amount'),
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
                              proceed();
                            },
                            child: Text(
                              'Proceed',
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

  addpromo() {
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
                      'Use promo code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      textInputAction: TextInputAction.done,
                      decoration: Decor()
                          .formDecor(context: context, labelText: 'Promo code'),
                    ),
                    customDivider(height: Sizes.h25),
                    SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: Decor().buttonDecor(context: context),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Proceed',
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
