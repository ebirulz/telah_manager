import 'package:flutter/material.dart';
import 'package:manager/screens/estate/more/incident_report/widgets/incident_report_card_widget.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';

class IncidentScreen extends StatefulWidget {
  const IncidentScreen({Key? key}) : super(key: key);

  @override
  State<IncidentScreen> createState() => _IncidentScreenState();
}

class _IncidentScreenState extends State<IncidentScreen> with SingleTickerProviderStateMixin {

  String? selectedValue;

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
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context,title: 'Incident Report',),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New",
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: AppColors.errorText,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Text("3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      text: 'Resolved',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //verticalDirection: VerticalDirection.up,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                         // mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IncidentReportCard(
                              name: 'Theft Report',
                              description: 'Lorem ipsum is a dummy text used in design to minimize the distraction in the flow of lop lorem ipsum.',
                              postedBy: 'Kelvin',
                              date: 'Today 4:35pm',
                            ),
                            SizedBox(height: 30,),
                            IncidentReportCard(
                              name: 'Flood',
                              description: 'Lorem ipsum is a dummy text used in design to minimize the distraction in the flow of lop lorem ipsum.',
                              postedBy: 'Keme',
                              date: 'Today 10:35pm',
                            ),
                            SizedBox(height: 30,),
                            IncidentReportCard(
                              name: 'Burglary',
                              description: 'Lorem ipsum is a dummy text used in design to minimize the distraction in the flow of lop lorem ipsum.',
                              postedBy: 'Uche',
                              date: 'Today 10:35am',
                            ),
                            ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

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