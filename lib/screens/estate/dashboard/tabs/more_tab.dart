import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/spacing.dart';
import '../widgets/more_tab_widget.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(0)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Settings",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            FxSpacing.height(20),
            singleRow(icon: Iconsax.user, title: "Guests", subTitle: "Manage invited guests", link: '/guest_list', context),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(icon: Iconsax.money_2, title: "Debtors", subTitle: "View all debtors", link: '/debtors_list', context ),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(icon: Iconsax.money_3, title: "Off-App Payments", subTitle: "View all payments", link: '/debtors_list', context ),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context,
                icon: Iconsax.category, title: "Projects", subTitle: "Manage estate projects", link: '/projects_list',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context,
                icon: Iconsax.refresh, title: "Services", subTitle: "Manage Estate utility services", link: '/services_list',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.sms, title: "Messages", subTitle: "Send and receive messages", link: '/messages',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.document_text, title: "Incident Report", subTitle: "Report incident e.g theft", link: '/incident_report',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.cloud_lightning, title: "Analytics", subTitle: "Generated revenues", link: '/analytics',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.status_up, title: "Financial Reports", subTitle: "View estate inflow and expenses", link: '/financial_report',),
            Divider(color: Colors.grey.withOpacity(0.9),),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.car, title: "Vehicles", subTitle: "Registered vehicles in the estate", link: '/settings',),
            FxSpacing.height(8),
            singleRow(context, icon: Iconsax.setting, title: "Settings", subTitle: "Account details and security", link: '/settings',),

            SizedBox(height: 15,),
            Align(
              alignment:Alignment.center ,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: AppColors.errorText,
                ),
                child: const Text('Log Out'),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}