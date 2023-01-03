import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/debtor_widget.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';

class GeneratedBillsScreen extends StatefulWidget {
  const GeneratedBillsScreen({Key? key}) : super(key: key);

  @override
  State<GeneratedBillsScreen> createState() => _GeneratedBillsScreenState();
}

class _GeneratedBillsScreenState extends State<GeneratedBillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Generated Bills'),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          DebtorGeneratedBillListWidget(
            context,
            amount: "N15,000",
            BillType: "Service Charge",
            DateRange: "Aug 1, 2022 - Aug 31, 2022",
            function: TransactionDialog,
          ),
        ],
      ),
    );
  }
  TransactionDialog(){
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
                  child: Text("Generated Bill",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.h20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NAME"),
                    Text("ELVIS BOND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("ADDRESS"),
                    SizedBox(height: 10,),
                    Text("100 BOND STREET", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("WASTE DISPOSAL"),
                    SizedBox(height: 10,),
                    Text("N5,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("SANITATION"),
                    SizedBox(height: 10,),
                    Text("N5,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("SECURITY"),
                    SizedBox(height: 10,),
                    Text("N5,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Period"),
                    SizedBox(height: 10,),
                    Text("Aug 1, 2022 - Aug 31, 2022", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),

                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20,bottom: 20),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.trash, buttonText: "Delete"),
                        customVerticalDivider(width: Sizes.w15),
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
}
