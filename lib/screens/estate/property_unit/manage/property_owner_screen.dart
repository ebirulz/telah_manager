import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/property_card_widgets.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';

class UnitPropertyOwnerScreen extends StatefulWidget {
  const UnitPropertyOwnerScreen({Key? key}) : super(key: key);

  @override
  State<UnitPropertyOwnerScreen> createState() => _UnitPropertyOwnerScreenState();
}

class _UnitPropertyOwnerScreenState extends State<UnitPropertyOwnerScreen>with SingleTickerProviderStateMixin {
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
      appBar: AppBarWidget().appbar(
          context: context,
          title: 'Property Owner',
      ),
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
                                      child: Text("EO",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white
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
                            Text("Block 41 Room 3, Sage Estates", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                            SizedBox(height: 20,),
                            Text("Move-In Date"),
                            SizedBox(height: 10,),
                            Text("---"),
                            SizedBox(height: 20,),
                            Text("Unpaid Bills"),
                            PropertyOwnerUnpaidBill(),
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
                            PropertyOwnerUnpaidBill(),
                            PropertyOwnerUnpaidBill(),
                            PropertyOwnerUnpaidBill(),
                            PropertyOwnerUnpaidBill(),
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
}