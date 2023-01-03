import 'package:flutter/material.dart';
import 'widgets/property_type_widgets.dart';

import '../../../../../util/colors.dart';
import '../../../../../widgets/app_bar.dart';

class PropertyTypeDetailsScreen extends StatefulWidget {
  const PropertyTypeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PropertyTypeDetailsScreen> createState() => _PropertyTypeDetailsScreenState();
}

class _PropertyTypeDetailsScreenState extends State<PropertyTypeDetailsScreen> with SingleTickerProviderStateMixin{
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
      appBar: AppBarWidget().appbar(context: context,title: 'Property Type - Bungalow',),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
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
                    text: 'Property Units',
                  ),
                  Tab(
                    text: 'Service Charge',
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
                          SizedBox(height: 20,),
                          PropertyUnitList(
                            context,
                            abv: "KL",
                            address: "102 Olive Drive",
                            name: "Kunle Lawal",
                          ),
                          PropertyUnitList(
                            context,
                            abv: "JR",
                            address: "90 Palm Avenue",
                            name: "Jerry Rowling",
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          PropertyServiceList(
                            context,
                            name: "Sanitation",
                            amount: "N5,000.00",
                            cycle: "Monthly",
                          ),
                          PropertyServiceList(
                            context,
                            name: "Waste Disposal",
                            amount: "N5,000.00",
                            cycle: "Monthly",
                          )
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPropertyAddressScreen()));*/
        },
        elevation: 0,
        backgroundColor: AppColors.defaultBlue,
        label: Text('Edit'),
        icon: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
