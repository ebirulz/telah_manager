import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/settlement_list_card.dart';

import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';

class SettlementDetailsScreen extends StatefulWidget {
  const SettlementDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SettlementDetailsScreen> createState() => _SettlementDetailsScreenState();
}

class _SettlementDetailsScreenState extends State<SettlementDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Settlement Details'),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          Padding(
            padding: EdgeInsets.only(top:20,bottom: 20),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.import, buttonText: "Download"),
                    customVerticalDivider(width: Sizes.w15),
                    ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                  ],
                )
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.h20,
                  ),
                ),
                Text("N150,000.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.h20,
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey.withOpacity(0.9),
              thickness: 0.5,
            ),
          ),
          SizedBox(height: 10,),
          SettlementDetails(
              initial: "JD",
              name: "John Doe",
              address: "114 Olive Drive",
              date: "20 May, 2022",
              amount: "N75,000.00",
              description: "Service Charge"
          ),
          SettlementDetails(
              initial: "KK",
              name: "Kelvin Keme",
              address: "114 Olive Drive",
              date: "20 May, 2022",
              amount: "N75,000.00",
              description: "Project"
          ),
        ],
      ),
    );
  }
}
