import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/debtor_widget.dart';
import 'widgets/menu_option_widget.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';

class DebtorProfileScreen extends StatefulWidget {
  const DebtorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DebtorProfileScreen> createState() => _DebtorProfileScreenState();
}

class _DebtorProfileScreenState extends State<DebtorProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Elvis Bond',action: debtorActionMenu(context),
          hasAction: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.defaultBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    color: AppColors.defaultBlue,
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: AppColors.borderLine.withOpacity(0.8),
                  tabs: [
                    Tab(
                      text: 'Summary',
                    ),
                    Tab(
                      text: 'Transactions',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Container(
                                    width: Sizes.w80,
                                    height: Sizes.h80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Sizes.w10),
                                      color: AppColors.defaultBlue,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("EB",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Text("Elvis Bond",
                                    style: TextStyle(
                                      fontSize: Sizes.w20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("100 Bond Street, Sage Estates"),
                                  SizedBox(height: 10,),
                                  Text("+23412345789"),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Property Unit Type"),
                            SizedBox(height: 10,),
                            Text("Duplex", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                            SizedBox(height: 20,),
                            Text("Address"),
                            SizedBox(height: 10,),
                            Text("100 Bond Street", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                            SizedBox(height: 20,),
                            Text("Move-In Date"),
                            SizedBox(height: 10,),
                            Text("---"),
                            SizedBox(height: 20,),
                            Text("Unpaid Bills"),
                            //PropertyOwnerUnpaidBill(),
                            SizedBox(height: 30,),
                            Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                                    customVerticalDivider(width: Sizes.w15),
                                    ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                                    SizedBox(height: 20,),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            DebtorPaidBillListWidget(
                              context,
                              amount: "N5,000",
                              BillType: "Service Charge",
                              DateRange: "Aug 1, 2022 - Aug 31, 2022",
                              function: TransactionDialog,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                  child: Text("Transaction Receipt",
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
                    SizedBox(height: 20,),
                    Text("Amount Paid"),
                    SizedBox(height: 10,),
                    Text("N5,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Transaction Type"),
                    SizedBox(height: 10,),
                    Text("OFF-APP PAYMENT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Payer"),
                    SizedBox(height: 10,),
                    Text("ELVIS BOND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Address"),
                    SizedBox(height: 10,),
                    Text("100 BOND STREET", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Purpose"),
                    SizedBox(height: 10,),
                    Text("SERVICE CHARGE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Transaction Date"),
                    SizedBox(height: 10,),
                    Text("Aug 1, 2022", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                    SizedBox(height: 20,),
                    Text("Authorized By"),
                    SizedBox(height: 10,),
                    Text("ELVIS BOND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
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
                        ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                        customVerticalDivider(width: Sizes.w15),
                        ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.share, buttonText: "Share"),
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
