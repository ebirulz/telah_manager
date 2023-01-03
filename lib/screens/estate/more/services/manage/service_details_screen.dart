import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/more/services/manage/widgets/option_menu_widget.dart';
import 'package:manager/screens/estate/more/services/manage/widgets/services_widgets.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/app_bar.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> with SingleTickerProviderStateMixin {
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
        title: 'Sanitation',
          action: ServiceActionAppbar(context),
          hasAction: true
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
                      text: 'Comments',
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
                            /*Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Container(
                                    width: Sizes.w50,
                                    height: Sizes.h50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Sizes.w10),
                                      color: AppColors.borderLine.withOpacity(.3),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(Iconsax.document, color: Colors.black,)
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Text("Sanitation",
                                    style: TextStyle(
                                      fontSize: Sizes.w20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),*/
                            SizedBox(height: 20,),
                            Text("PROPERTY UNIT TYPES", style: TextStyle(fontWeight: FontWeight.bold),),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 0.5,
                            ),
                            SizedBox(height: 10,),
                            ServicePropertyTypeList(
                                propertyType:'Duplex',
                                amount: ''
                            ),
                            ServicePropertyTypeList(
                                propertyType:'Bungalow',
                                amount: ''
                            ),
                            SizedBox(height: 15,),
                            Text("RATING", style: TextStyle(fontWeight: FontWeight.bold),),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 0.5,
                            ),
                            SizedBox(height: 10,),
                            Text("Not available"),
                            SizedBox(height: 30,),

                          ],
                        ),
                      ),
                    ),
                    //Bills Tab
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            ServicesTransactionListCard(
                              context,
                              amount: 'N6,000.00',
                              address: '116 Olive Drive',
                              date: 'Sept 1 - Sept 30, 2022 '
                            ),
                            ServicesTransactionListCard(
                                context,
                                amount: 'N6,000.00',
                                address: '13 C Wing',
                                date: 'Sept 1 - Sept 30, 2022 '
                            ),
                          ],
                        ),
                      ),
                    )
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
