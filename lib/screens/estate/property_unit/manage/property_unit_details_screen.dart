import 'package:flutter/material.dart';
import 'package:manager/providers/workspace_provider.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/option_menu_widget.dart';
import 'package:manager/screens/estate/property_unit/manage/widgets/property_card_widgets.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../providers/login_response_provider.dart';
import '../../../../util/colors.dart';
import '../../../../util/functions.dart';
import '../../../../util/size_model.dart';

class PropertyUnitDetailsScreen extends StatefulWidget {
  const PropertyUnitDetailsScreen({Key? key, this.propertyUnit})
      : super(key: key);

  final Map<String, dynamic>? propertyUnit;

  @override
  State<PropertyUnitDetailsScreen> createState() =>
      _PropertyUnitDetailsScreenState();
}

class _PropertyUnitDetailsScreenState extends State<PropertyUnitDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List _propertyUnit = [
    {'totalOutstanding': 0.00}
  ];
  List _transactions = [];

  getPu() async {
    final profile = Provider.of<LoginResponseProvider>(context, listen: false)
        .loginResponse;
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);

    Map<String, dynamic>? pu = await prov.fetchPropertyUnit(
        widget.propertyUnit!['property']['workspaceId'],
        widget.propertyUnit!['id'],
        profile.accessToken);
    //prettyPrint(pu!['results'][0]);
    setState(() {
      _propertyUnit = pu!['results'];
    });
  }

  getPuTransactions() async {
    final profile = Provider.of<LoginResponseProvider>(context, listen: false)
        .loginResponse;
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);

    Map<String, dynamic>? pu = await prov.fetchPropertyUnitTransactions(
        widget.propertyUnit!['id'], profile.accessToken);
    //prettyPrint(pu!['results'][0]);
    setState(() {
      _transactions = pu!['results'];
    });
  }

  @override
  void initState() {
    getPu();
    getPuTransactions();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  String getInitials(String bank_account_name) => bank_account_name.isNotEmpty
      ? bank_account_name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    //prettyPrint(widget.propertyUnit);
    return Consumer<WorkspaceProvider>(builder: (context, wp, _) {
      Map<String, dynamic> propertyUnit = wp.propertyUnit;

      Map<String, dynamic> owner = propertyUnit!['activeTenures'][0];
      List tenures = propertyUnit['activeTenures'];

      List tenants = tenures.length > 1
          ? tenures.where((element) => element['type'] != 'UNIT_OWNER').toList()
          : [];

      return Scaffold(
        appBar: AppBarWidget().appbar(
            context: context,
            title: 'Property Unit',
            action: actionAppbar(context),
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
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UnitUnpaidBill(
                                _propertyUnit[0]['totalOutstanding']),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Address"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${propertyUnit['houseNumber']} ${propertyUnit['streetName']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.w16),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Property Unit Type"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${propertyUnit['billingGroup']['name']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.w16),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Property Owner"),
                            SizedBox(
                              height: 10,
                            ),
                            PropertyOwner(context,
                                abv:
                                    "${getInitials(owner['primaryResidents'][0]['displayName'])}",
                                name:
                                    "${owner['primaryResidents'][0]['displayName']}",
                                percentage: "50%",
                                email:
                                    "${owner['primaryResidents'][0]['phoneNumber']}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Tenants"),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: tenants.length,
                                    itemBuilder: (context, index) {
                                      return Tenants(
                                        context,
                                        abv:
                                            "${getInitials(tenants[index]['primaryResidents'][0]['displayName'])}",
                                        name:
                                            "${tenants[index]['primaryResidents'][0]['displayName']}",
                                        percentage:
                                            "${tenants[index]['serviceChargePercentage']}%",
                                        email:
                                            "${tenants[index]['primaryResidents'][0]['phoneNumber']}",
                                      );
                                    })),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: _transactions.length,
                                itemBuilder: (context, index) {
                                  return UnitTransaction(
                                      context, _transactions[index]);
                                },
                              ),
                            ),
                            /* UnitTransaction(context),
                            UnitTransaction(context), */
                          ],
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
    });
  }
}
