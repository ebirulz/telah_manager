import 'package:flutter/material.dart';
import 'package:manager/screens/estate/more/services/manage/widgets/option_menu_widget.dart';
import '../create/add_service_screen.dart';
import 'widgets/services_widgets.dart';

import '../../../../../util/colors.dart';
import '../../../../../widgets/app_bar.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Services', action: ServiceActionAppbar(context),
          hasAction: true),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          ServicesListCard(
            context,
            serviceName: 'Sanitation',
            billingCycle: 'Monthly',
          ),
          ServicesListCard(
            context,
            serviceName: 'Waste Disposal',
            billingCycle: 'Monthly',
          ),
          ServicesListCard(
            context,
            serviceName: 'Security',
            billingCycle: 'Monthly',
          ),
          ServicesListCard(
            context,
            serviceName: 'Electricity',
            billingCycle: 'Monthly',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddServiceScreen()));
        },
        elevation: 0,
        backgroundColor: AppColors.defaultBlue,
        label: Text('Add New Service'),
        icon: const Icon(Icons.add),
        //child: const Icon(Icons.add),
      ),
    );
  }
}
