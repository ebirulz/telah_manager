import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../util/colors.dart';
import '../../../util/size_model.dart';


class WalletCardTopUpScreen extends StatefulWidget {
  const WalletCardTopUpScreen({Key? key}) : super(key: key);

  @override
  State<WalletCardTopUpScreen> createState() => _WalletCardTopUpScreenState();
}

class _WalletCardTopUpScreenState extends State<WalletCardTopUpScreen> {

  late TextEditingController amount;

  @override
  void initState() {
    super.initState();
    amount = TextEditingController();
  }

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
                    Text("Credit / Debit Card Payment",
                      style: TextStyle(
                        fontSize: Sizes.w25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Add funds to your wallet using your card. It is secure, safe and powered by flutterwave",
                      style: TextStyle(
                          fontSize: Sizes.w18,
                          color: AppColors.subText
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FormBuilderTextField(
                      name: "Amount",
                      controller: amount,
                      decoration: const InputDecoration(
                          labelText: 'Amount',
                          suffixIcon: Icon(Iconsax.moneys)
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonText: "Proceed to Payment",
                buttonHeight: Sizes.h50,
                buttonColor: AppColors.defaultBlue),
          ).paddingOnly(bottom: 20, right: 10, left: 10),
        ],
      ),

    );
  }
  proceed() {
    /*Navigator.push(
        context, MaterialPageRoute(builder: (context) => EstateEmailScreen())
    );*/
  }
}
