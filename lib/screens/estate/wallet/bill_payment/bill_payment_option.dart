import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/decor.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_dividers.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({Key? key}) : super(key: key);

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Pay Service Charge'),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.errorText.withOpacity(.08),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Column(
                children: [
                  Text('Total Due', style: TextStyle(fontSize: Sizes.w18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("N20,000", style: TextStyle(fontSize: Sizes.w24, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("Upcoming N10,000", style: TextStyle(fontSize: Sizes.w17,),),
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width:30,
                height: 30,
                decoration: BoxDecoration(
                    //color: AppColors.defaultBlue.withOpacity(0.2),
                  border: Border.all(color: AppColors.defaultBlue),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("1", style: TextStyle(fontSize: Sizes.w20, fontWeight: FontWeight.bold),),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OFF-APP PAYMENT",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: Sizes.w20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(
                      "Use the details below to pay directly into the approved bank account",
                      style: TextStyle(
                        fontSize: Sizes.w16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("01234567890", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                  SizedBox(height: 5,),
                  Text("Telah Nigeria", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                  SizedBox(height: 5,),
                  Text("Zenith Bank Plc", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: 270,
                    child: Text("Kindly report all off-app payments to Telah Sales Representative"),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width:30,
                height: 30,
                decoration: BoxDecoration(
                  //color: AppColors.defaultBlue.withOpacity(0.2),
                    border: Border.all(color: AppColors.defaultBlue),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("2", style: TextStyle(fontSize: Sizes.w20, fontWeight: FontWeight.bold),),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WALLET PAYMENT",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: Sizes.w20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(
                      "Get your bills paid instantly using this option",
                      style: TextStyle(
                        fontSize: Sizes.w16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Your Wallet Balance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                  SizedBox(height: 5,),
                  Text("N10,700.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                  SizedBox(height: 15,),
                  Container(
                    width: 270,
                    child: FormBuilder(
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: "Amount",
                            decoration: const InputDecoration(
                              labelText: 'Amount',
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [

                              Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: AppColors.defaultBlue, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    onPressed: (){

                                    },
                                    child: Text('Pay'),
                                  )
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: AppColors.defaultBlue, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: (){
                                  addTopUp();
                                },
                                child: Text('Top-up Wallet'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
  addTopUp() {
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
                      'Top-Up Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    FormBuilderTextField(
                      name: "Amount",
                      decoration: const InputDecoration(
                          labelText: 'Amount',
                          suffixIcon: Icon(Iconsax.money)
                      ),
                      textInputAction: TextInputAction.done,
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
