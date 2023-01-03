import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:manager/widgets/custom_dividers.dart';
import '../widgets/dashboard_widgets.dart';
import '../widgets/custom_widgets.dart';
import '../model/dashboard_model.dart';
import '../../../../util/size_model.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  List<ToDo> listTodo = [
    ToDo(Iconsax.profile_add, 'Onboard a tenant',
        'Generate a code for a new tenant today',''),
    ToDo(Iconsax.add, 'Add a unit',
        'Generate a code for a new tenant today','/add_agent_property'),
    ToDo(Iconsax.clock, 'Schedule a maintenance',
        'Generate a code for a new tenant today',''),
    ToDo(Iconsax.clipboard_text, 'Resolve an issue',
        'Generate a code for a new tenant today',''),
    ToDo(Iconsax.danger, 'Give a quit notice',
        'Generate a code for a new tenant today',''),
    ToDo(Iconsax.profile_remove, 'Terminate tenancy',
        'Generate a code for a new tenant today',''),
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 12) {
      message = 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening';
    } else {
      message = 'Good Night';
    }
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Sizes.h80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: Sizes.w10, left: Sizes.w10),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: message,
                            style: TextStyle(color: Colors.black,
                                fontSize: Sizes.w20,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: " John",
                            style: TextStyle(color: Colors.black,
                                fontSize: Sizes.w20,
                                fontWeight: FontWeight.bold)),

                      ]
                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: Sizes.w10, left: Sizes.w10),
                  child: Text(
                    'Agent',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.h10, right: Sizes.w10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.sms, size: Sizes.w30, color: Colors.black,),
                customVerticalDivider(width: Sizes.w15),
                Icon(Iconsax.notification, size: Sizes.w30, color: Colors.black,),
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: Sizes.w25, right: Sizes.w25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to do today?',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
              ),
              customDivider(height: Sizes.h20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listTodo.map((data) =>todoWidget(context, data.icon!, data.title!, data.subtitle!, data.link!))
                      .toList(),
                ),
              ),
              customDivider(height: Sizes.h20),
              Container(
                width: double.infinity,
                height: Sizes.h150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
                child: Padding(
                  padding: EdgeInsets.only(left: Sizes.w15, right: Sizes.w15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Iconsax.category, size: Sizes.w30, color: Colors.black,),
                            customVerticalDivider(width: 10),
                            Text('Property units',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.w20))
                          ],
                        ),
                        customDivider(height: Sizes.h15),
                        Row(
                          children: [
                            units(0, 'Total'),
                            customVerticalDivider(width: Sizes.w15),
                            units(0, 'occupied'),
                            customVerticalDivider(width: Sizes.w15),
                            units(0, 'Vacant')
                          ],
                        )
                      ]),
                ),
              ),
              customDivider(height: Sizes.h20),
              Container(
                  width: double.infinity,
                  height: Sizes.h165,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.1),
                      borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
                  child: AccountSetup(context)
              ),
              customDivider(height: Sizes.h20),
              UnpaidBills(),
              customDivider(height: Sizes.h20),
              ExpiringSoon()
            ],
          ),
        ),
      )
    );
  }
}