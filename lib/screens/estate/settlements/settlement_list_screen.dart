import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/settlements/settlement_details_screen.dart';
import 'package:manager/util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'widgets/settlement_list_card.dart';

import '../../../widgets/app_bar.dart';

class SettlementListScreen extends StatefulWidget {
  const SettlementListScreen({Key? key}) : super(key: key);

  @override
  State<SettlementListScreen> createState() => _SettlementListScreenState();
}

class _SettlementListScreenState extends State<SettlementListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Settlements',),
      body: ListView(
        children: [
          SettlementList(
            context,
            amount: "N4,000,000",
            date: "07 May 2020",
            function: detailsScreen,
          ),
        ],
      ),
    );
  }
  proceed(){
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context){
          return Wrap(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text("Payment Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.h20,
                    ),
                  ),
                ),
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
              SizedBox(height: 20,),
              Center(
                child: Container(
                  width: Sizes.w150,
                  height: Sizes.h80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(.3),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      Text('Amount'),
                      SizedBox(height: 10,),
                      Text("N150,000.00"),
                    ],
                  ),
                ),
              ),
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
            ],
          );
        }
    );
  }
  detailsScreen(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettlementDetailsScreen())
    );
  }
}
