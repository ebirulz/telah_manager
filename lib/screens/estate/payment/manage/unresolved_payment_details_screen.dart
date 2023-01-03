import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

class UnresolvedPaymentDetailsScreen extends StatefulWidget {
  const UnresolvedPaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UnresolvedPaymentDetailsScreen> createState() => _UnresolvedPaymentDetailsScreenState();
}

class _UnresolvedPaymentDetailsScreenState extends State<UnresolvedPaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Sizes.h70,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('John Doe', style: TextStyle(color: Colors.black, fontSize: Sizes.w18, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Summary", style: TextStyle(fontSize: Sizes.w18, fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Center(
              child: Container(
                width: Sizes.w80,
                height: Sizes.h80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.w10),
                  color: AppColors.defaultBlue,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("EO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text("Ebimobowei Okpongu",
              style: TextStyle(
                fontSize: Sizes.w20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text("Block 23, Sage Estates"),
            SizedBox(height: 20,),
            Text("Property Unit Type"),
            SizedBox(height: 10,),
            Text("Bungalow", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: Sizes.h130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.warningText.withOpacity(.15),
                  borderRadius:
                  BorderRadius.all(Radius.circular(Sizes.w15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('N2,000,000',
                      style: TextStyle(
                          color: AppColors.defaultBlue, fontSize: Sizes.w25, fontWeight: FontWeight.bold)),
                  customDivider(height: Sizes.h5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Text('Service Charge',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.w15)),
                  ),
                  customDivider(height: Sizes.h5),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Center(
                /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.import, buttonText: "Download"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                    SizedBox(height: 20,),
                  ],
                )*/
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  InkWell(
                      onTap: (){
                        ApprovePayment();
                      },
                      child: Container(
                          padding: EdgeInsets.only(top:5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.success),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.check, color: AppColors.success,),
                              Text('Approve', style: TextStyle(fontSize: Sizes.w20, color: AppColors.success, fontWeight: FontWeight.bold),)
                            ],
                          )
                      )
                  ),
                  customVerticalDivider(width: Sizes.w25),
                  InkWell(
                      onTap:(){
                        RejectPayment();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.errorText), borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                          child: Row(
                            children: [
                              Icon(Icons.close, color: AppColors.errorText,),
                              Text('Reject', style: TextStyle(fontSize: Sizes.w20, color: AppColors.errorText, fontWeight: FontWeight.bold),)
                            ],
                          )
                      )
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RejectPayment() {
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
                      'Enter reason for rejection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    FormBuilderTextField(
                      name: "Reason",
                      decoration: const InputDecoration(
                          labelText: 'Reason',
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    customDivider(height: Sizes.h25),
                    SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                          //style: Decor().buttonDecor(context: context),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.errorText,
                          elevation: 0,
                        ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Reject',
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

  ApprovePayment() {
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
                      'Are you sure you want to resolve this payment?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    customDivider(height: Sizes.h25),
                    SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                        //style: Decor().buttonDecor(context: context),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.success,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Yes, resolve',
                            style: TextStyle(fontSize: Sizes.w20),
                          )),
                    ),
                    Center(
                      child: TextButton(onPressed: (){Navigator.pop(context);}, child: Text("No, don't resolve")),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}