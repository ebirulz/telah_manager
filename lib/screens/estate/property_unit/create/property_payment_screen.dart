import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/property_unit/create/property_unit_created_screen.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/decor.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';



class PropertyPaymentScreen extends StatefulWidget {
  const PropertyPaymentScreen({Key? key}) : super(key: key);

  @override
  State<PropertyPaymentScreen> createState() => _PropertyPaymentScreenState();
}

class _PropertyPaymentScreenState extends State<PropertyPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget().appbar(context: context,),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Center(
                      child: FAProgressBar(
                        currentValue: 70,
                        backgroundColor: const Color(0xffE3E6E8),
                        progressColor: AppColors.defaultBlue,
                        size: 9,
                      )
                  ),
                ),
                SizedBox(height: 20,),
                SvgPicture.asset(AssetsPath.formPayment, height: 60,),
                SizedBox(height: 20,),
                const SizedBox(
                  width: 250,
                  child: Text(
                      'Payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      )
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  //width: 250,
                  child:
                  Text('Almost done! Time to make payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
                SizedBox(height: 15,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Registration fee per unit: ",
                        style: TextStyle(color: AppColors.borderLine, fontSize: Sizes.w18, fontFamily: 'Raleway')),
                    TextSpan(
                        text: "N350",
                        style: TextStyle(color: Colors.black, fontSize: Sizes.w18, fontWeight: FontWeight.bold)),

                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  height: Sizes.h100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(.1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.w15))),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 124),
                            child: Text('Wallet balance',
                                style: TextStyle(
                                    fontSize: Sizes.w18)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: (){},
                              child: Icon(Iconsax.refresh),
                            ),
                          )
                        ],
                      ),

                      Text('NGN 0.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w22)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  height: Sizes.h90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.defaultBlue.withOpacity(.1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.w15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Promo Balance',
                          style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontSize: Sizes.w18)),
                      customDivider(height: Sizes.h5),
                      Text('NGN 0.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w22)),
                      customDivider(height: Sizes.h5),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [

                    Padding(
                        padding: EdgeInsets.only(left: 16, right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: AppColors.defaultBlue, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: (){
                            addTopUp();
                          },
                          child: Text('Top-up'),
                        )
                    ),


                    TextButton(
                        onPressed: () {
                          addPromo();
                        },
                        child: Text(
                          'Use promo code',
                          style: TextStyle(
                            color: AppColors.defaultBlue,
                            fontSize: Sizes.w18,
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, bottom: 8, top: 8),
                  child: Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.defaultBlue,
                      //color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        highlightColor: Colors.blue.shade400,
                        onTap: () {
                          final progress = ProgressHUD.of(context);
                          progress?.showWithText('Processing payment...');
                          Future.delayed(Duration(seconds: 4), () {
                            progress?.dismiss();
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const PropertyUnitCreatedScreen()));
                          }
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Process payment",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  proceed() {
    final progress = ProgressHUD.of(context);
    progress?.showWithText('Processing payment...');
    Future.delayed(Duration(seconds: 4), () {
      progress?.dismiss();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const PropertyUnitCreatedScreen()));
    });

  }

  addPromo() {
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
                    FormBuilderTextField(
                      name: "promo",
                      decoration: const InputDecoration(
                          labelText: 'Promo Code',
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