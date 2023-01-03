import 'package:flutter/material.dart';
import 'widgets/property_type_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/spacing.dart';
import '../../../../../widgets/app_bar.dart';

class PropertyTypeListScreen extends StatefulWidget {
  const PropertyTypeListScreen({Key? key}) : super(key: key);

  @override
  State<PropertyTypeListScreen> createState() => _PropertyTypeListScreenState();
}

class _PropertyTypeListScreenState extends State<PropertyTypeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Property Type',),
      body: ListView(
        children: [

          Container(
            margin: FxSpacing.fromLTRB(16, 5, 16, 0),
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
                                hintText: "Search",
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
          SizedBox(height: 15,),
          SingleChildScrollView(
            child: Column(
              children: [
                PropertyTypeList(
                  context,
                  propertyType: "Bungalow",
                  unitNumber: "(5 Units)",
                  serviceCharge: "Service Charge Fee: N20,000.00",
                    billingCycle: "Billing Cycle: Monthly"
                ),
                PropertyTypeList(
                    context,
                    propertyType: "Flat",
                    unitNumber: "(50 Units)",
                    serviceCharge: "No Description",
                    billingCycle: "Billing Cycle: Monthly"
                ),
                PropertyTypeList(
                    context,
                    propertyType: "Terrace",
                    unitNumber: "(15 Units)",
                    serviceCharge: "No Description",
                    billingCycle: "Billing Cycle: Monthly"
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          /*Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPropertyAddressScreen()));*/
        },
        elevation: 0,
        backgroundColor: AppColors.defaultBlue,
        label: Text('Add Property Type'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
