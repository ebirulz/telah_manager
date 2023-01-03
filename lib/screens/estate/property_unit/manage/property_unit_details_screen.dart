import 'package:flutter/material.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/option_menu_widget.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/property_card_widgets.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';

class PropertyUnitDetailsScreen extends StatefulWidget {
  const PropertyUnitDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PropertyUnitDetailsScreen> createState() => _PropertyUnitDetailsScreenState();
}

class _PropertyUnitDetailsScreenState extends State<PropertyUnitDetailsScreen> with SingleTickerProviderStateMixin {

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
        title: 'Room 1, Block 1',
          action: actionAppbar(context),
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
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UnitUnpaidBill(),
                          SizedBox(height: 20,),
                          Text("Address"),
                          SizedBox(height: 10,),
                          Text("Block 41 Room 3, Sage Estates", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                          SizedBox(height: 20,),
                          Text("Property Unit Type"),
                          SizedBox(height: 10,),
                          Text("Duplex", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
                          SizedBox(height: 20,),
                          Text("Property Owner"),
                          SizedBox(height: 10,),
                          PropertyOwner(
                              context,
                            abv: "JD",
                            name: "John Doe",
                            percentage: "50%",
                            email: "ebi.okpongu@gmail.com"
                          ),
                          SizedBox(height: 20,),
                          Text("Tenants"),
                          SizedBox(height: 10,),
                          Tenants(
                            context,
                            abv: "KL",
                            name: "Kunle Lawal",
                            percentage: "50%",
                            email: "kunle@yahoo.com",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            UnitTransaction(context),
                            UnitTransaction(context),
                            UnitTransaction(context),
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