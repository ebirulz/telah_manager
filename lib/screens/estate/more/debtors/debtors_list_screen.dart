import 'package:flutter/material.dart';
import 'package:manager/providers/debtors_provider.dart';
import 'package:provider/provider.dart';
import '../../../../providers/workspace_provider.dart';
import 'widgets/debtor_widget.dart';

import '../../../../util/colors.dart';
import '../../../../widgets/app_bar.dart';

class DebtorsListScreen extends StatefulWidget {
  const DebtorsListScreen({Key? key}) : super(key: key);

  @override
  State<DebtorsListScreen> createState() => _DebtorsListScreenState();
}

class _DebtorsListScreenState extends State<DebtorsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
print('******init state');
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);
    String workspaceId = prov.getWorkspace!['workspace']['workspaceId'];
    Provider.of<DebtorsProvider>(context, listen: false).fetchLedgers(workspaceId, 'AMENITY');
    Provider.of<DebtorsProvider>(context, listen: false).fetchLedgers(workspaceId, 'PROJECT');
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
        title: 'Debtors',
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
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
                    text: 'Service Charge',
                  ),
                  Tab(
                    text: 'Projects',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  //child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TotalDebtorsAmountCardWidget(
                        context,
                        title: 'Outstanding (Service Charge)',
                        amount: "N${context.watch<DebtorsProvider>().amenity['totalOutstanding']}",
                        function: generateStatement(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      /* DebtorsListWidget(
                              address: '100 Bond Street',
                              name: 'Elvis Bond',
                              amount: 'N500,000',
                            ),
                            DebtorsListWidget(
                              address: '105 Raji Rasaki Avenue',
                              name: 'Banky W',
                              amount: 'N1,500,000',
                            ), */
                      Expanded(
                        child: ListView.builder(
                            //shrinkWrap: false,
                            itemCount:
                                context.watch<DebtorsProvider>().get.length,
                            itemBuilder: (context, index) {
                              return DebtorsListWidget(
                                address:
                                    '${context.watch<DebtorsProvider>().get[index].tenure!.propertyUnit.houseNumber} ${context.watch<DebtorsProvider>().get[index].tenure!.propertyUnit.streetName}',
                                name:
                                    '${context.watch<DebtorsProvider>().get[index].tenure!.primaryResidents[0].displayName}',
                                amount:
                                    'N${context.watch<DebtorsProvider>().get[index].totalOutstanding}',
                                debtor:
                                    context.watch<DebtorsProvider>().get[index],
                              );
                            }),
                      ),
                    ],
                  ),
                  //),
                ),
                Container(
                  //child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TotalDebtorsAmountCardWidget(
                          context,
                          title: 'Outstanding (Project)',
                          amount: "N${context.watch<DebtorsProvider>().project['totalOutstanding']}",
                          function: generateStatement(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        /*ProjectDebtorsListWidget(
                          context,
                          name: 'Kayode Ola',
                          address: '123 Olive Drive',
                          amount: 'N50,000',
                          function: ProjectDebtor,
                        )*/
                        Expanded(
                          child: ListView.builder(
                            //shrinkWrap: false,
                              itemCount:
                              context.watch<DebtorsProvider>().projects.length,
                              itemBuilder: (context, index) {
                                return ProjectDebtorsListWidget(
                                  context,
                                  name: '${context.watch<DebtorsProvider>().projects[index]['project']['billingType']}',
                                  address: '${context.watch<DebtorsProvider>().projects[index]['project']['name']}',
                                  amount: 'N${context.watch<DebtorsProvider>().projects[index]['totalOutstanding']}',
                                  function: ProjectDebtor,
                                );
                              }),
                        ),
                      ],
                    ),
                  //),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  ServiceChargeDebtor() {}
  ProjectDebtor() {}
  generateStatement() {}
}
