import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/wallet/wallet_bank_topup_screen.dart';
import 'package:manager/screens/estate/wallet/wallet_card_topup_screen.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../util/size_model.dart';

class WalletTopUpScreen extends StatefulWidget {
  const WalletTopUpScreen({Key? key}) : super(key: key);

  @override
  State<WalletTopUpScreen> createState() => _WalletTopUpScreenState();
}

class _WalletTopUpScreenState extends State<WalletTopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Top-Up Wallet'),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //contentOverView(),
            SizedBox(
              height: 15,
            ),
            Text(
                "How will you like",
                style:TextStyle(
                  fontSize: Sizes.w22,
                  fontWeight: FontWeight.bold
                )
            ),
            Text(
              "to top-up your wallet?",
                style:TextStyle(
                    fontSize: Sizes.w22,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WalletBankTopUpScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width:80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: AppColors.defaultBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Icon(Iconsax.bank, size: 40, color: AppColors.defaultBlue,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By bank transfer",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: Sizes.w20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Pay by making a local transfer",
                        style: TextStyle(
                          fontSize: Sizes.w16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WalletCardTopUpScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      width:80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.defaultBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    child: Icon(Iconsax.card, size: 40, color: AppColors.defaultBlue,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By Credit / Debit Card",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: Sizes.w20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Add funds with your card",
                        style: TextStyle(
                          fontSize: Sizes.w16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
