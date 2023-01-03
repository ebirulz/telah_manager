import 'package:flutter/material.dart';
import 'package:manager/screens/estate/more/guests/widget/guest_card_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../util/spacing.dart';
import '../../../../widgets/app_bar.dart';

class GuestListScreen extends StatefulWidget {
  const GuestListScreen({Key? key}) : super(key: key);

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> with SingleTickerProviderStateMixin {
  String? selectedValue;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context,title: 'Guests',),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                //margin: FxSpacing.fromLTRB(10, 10, 15, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: FxSpacing.vertical(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: AppColors.borderLine, width: .7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: FxSpacing.left(12),
                              child: Icon(
                                MdiIcons.magnify,
                                color: AppColors.stepperBg,
                                size: 28,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: FxSpacing.left(12),
                                child: TextFormField(

                                  decoration: InputDecoration(
                                    fillColor: AppColors.stepperBg,
                                    hintText: "Search for guests",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    isDense: true,
                                  ),
                                  textCapitalization: TextCapitalization.sentences,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.defaultBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
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
                      text: 'Pending',
                    ),
                    Tab(
                      text: 'Ongoing',
                    ),
                    Tab(
                      text: 'Ended',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            PendingGuestCard(
                              name: 'Ukeme Uche',
                              address: '23 Melvin Drive',
                              date: '20th Feb 2022',
                            ),
                            PendingGuestCard(
                              name: 'Rasaki Kunle',
                              address: '23 Melvin Drive',
                              date: '20th Feb 2022',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            OngoingGuestCard(
                              name: 'Ukeme Uche',
                              address: '23 Melvin Drive',
                              date: 'Checked in 30 mins ago',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            EndedGuestCard(
                              name: 'Ukeme Uche',
                              address: '23 Melvin Drive',
                              date: 'Ended 30 mins ago',
                            ),
                            EndedGuestCard(
                              name: 'Kelvin Andrew',
                              address: '31 Previt Drive',
                              date: 'Ended 30 mins ago',
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
}