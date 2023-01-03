import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_dividers.dart';

class WalletBankTopUpScreen extends StatefulWidget {
  const WalletBankTopUpScreen({Key? key}) : super(key: key);

  @override
  State<WalletBankTopUpScreen> createState() => _WalletBankTopUpScreenState();
}

class _WalletBankTopUpScreenState extends State<WalletBankTopUpScreen> {
  String accountNumber = "1234567890";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Top-Up Wallet'),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bank transfer",
                      style: TextStyle(
                        fontSize: Sizes.w25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Transfer from any bank to the account details below and your wallet will be funded",
                      style: TextStyle(
                          fontSize: Sizes.w18,
                          color: AppColors.subText
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: Sizes.h250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          //color: Colors.grey.withOpacity(.15),
                        border: Border.all(color: Colors.grey.withOpacity(.3)),
                          borderRadius:BorderRadius.all(Radius.circular(Sizes.w15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bank Details',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Sizes.w22)),
                          customDivider(height: Sizes.h15),
                          Text('WEMA Bank',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.w24)),
                          customDivider(height: Sizes.h15),
                          ElevatedButton.icon(
                              onPressed: () => {
                              toasty(context, 'Account Number Copied'),
                              Clipboard.setData(ClipboardData(text: accountNumber))
                              },
                              label: Text(
                                '1234567890',style: TextStyle(
                                fontSize: Sizes.w25,
                                //fontWeight: FontWeight.bold,
                              ),
                              ),
                              icon: Icon(
                                Iconsax.copy,
                                color: Colors.white,
                                size: 30.0,
                              ),

                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.all(10),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          customDivider(height: Sizes.h15),
                          Text('Click to copy number',
                              style: TextStyle(
                                  color: AppColors.subText,
                                  fontSize: Sizes.w20)),
                          customDivider(height: Sizes.h5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton.icon(
                onPressed: () {
                  toasty(context, 'Coming Soon');
                },
                icon: Icon(
                  Iconsax.card_tick,
                  color: AppColors.defaultBlue,
                ),
                label: Text(
                  'I have made the payment',
                  style: primaryTextStyle(),
                )
            ),
          ).paddingOnly(bottom: 20, right: 10, left: 10),
        ],
      ),
    );
  }
}