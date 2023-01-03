import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/notification/notification_screen.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../widgets/custom_dividers.dart';
import '../widgets/dashboard_widgets.dart';
import '../widgets/custom_widgets.dart';
import '../model/dashboard_model.dart';
import '../../../../util/size_model.dart';
import '../widgets/outstanding_bill.dart';
import '../widgets/unverified_payment.dart';
import '../widgets/upcoming_bill.dart';
import 'package:intl/intl.dart';


class DashboardTab extends StatefulWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  List<ToDo> listTodo = [
    ToDo(Iconsax.profile_add, 'Record Payment',
        'Log payments made by a resident via bank account. ','/record_payment'),
    ToDo(Iconsax.clock, 'Add a property unit',
        'Generate a code for a new tenant today','/add_property_unit'),
    ToDo(Iconsax.add, 'Record Expense',
        'Log record of your Estate expenses as you go','/record_expenses'),
    ToDo(Iconsax.danger, 'Remove a resident',
        'Generate a code for a new tenant today','/remove_resident'),
    ToDo(Iconsax.clipboard_text, 'Resolve an issue',
        'Generate a code for a new tenant today','/incident_report'),
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 12) {
      message = 'Good Morning, ';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon, ';
    } else if ((timeNow > 16) && (timeNow < 23)) {
      message = 'Good Evening, ';
    } else {
      message = 'Good Evening, ';
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
                            text: "Mr. John",
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
                    'Chairman, Sage Estate...',
                    style: TextStyle(color: Colors.black, fontSize: Sizes.w15),
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
                InkWell(
                  onTap: (){
                    workspace();
                  },
                  child: SvgPicture.asset(AssetsPath.workspace, height: Sizes.w25, color: Colors.black),
                ),
                customVerticalDivider(width: Sizes.w10),
                InkWell(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
                  },
                    child: Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Badge(
                          badgeContent: Text('3', style: TextStyle(fontSize: 13, color: Colors.white),),
                          child: Icon(Iconsax.notification, size: Sizes.w30, color: Colors.black,),
                        )
                    )
                )
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
                  //height: Sizes.h165,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.1),
                      borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
                  child: AccountSetup(context)
              ),
              customDivider(height: Sizes.h20),
              Container(
                width: double.infinity,
                height: Sizes.h90,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Units',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                              ),
                              customDivider(height: Sizes.h10),
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,),
                              )
                            ],
                          ),
                        )),
                    Container(
                      height: Sizes.h50,
                      width: Sizes.h1,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Active Residents',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                              ),
                              customDivider(height: Sizes.h10),
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      height: Sizes.h50,
                      width: Sizes.h1,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Debtors',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                              ),
                              customDivider(height: Sizes.h10),
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              customDivider(height: Sizes.h20),
              Row(
                children: [
                  optionMenu(context, Iconsax.empty_wallet, 'Payments', AppColors.success.withOpacity(.6), '/manager_payment'),
                  customVerticalDivider(width: Sizes.w15),
                  optionMenu(context, Iconsax.money_3, 'Expenditure', AppColors.warningText.withOpacity(.6), '/manager_expenditure'),
                  customVerticalDivider(width: Sizes.w15),
                  optionMenu(context, Iconsax.money_2, 'Settlements', AppColors.purpleBox.withOpacity(.6), '/settlements'),
                ],
              ),
              customDivider(height: Sizes.h20),
              UnverifiedPayments(
                  context,
                UnitsNumber: "1 Unit",
                TotalAmount: "N30,000.00",
                Initials: "EO",
                Name: "Ebimobowei Okpongu",
                Address: "Block 1, Room 5",
                Amount: "N30,000.00",
              ),
              customDivider(height: Sizes.h20),
              OutstandingBills(context),
              customDivider(height: Sizes.h20),
              UpcomingBill(
                context,
                TotalAmount: "N30,000.00",
                UpcomingAmount: "N30,000.00",
                DueDate: "Due Sun, May 1, 2022",
              ),
              customDivider(height: Sizes.h20),
            ],
          ),
        ),
      ),
    );
  }

  workspace(){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return Container(
            //height: 350.0,
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Switch Workspace",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  child:  Icon(Iconsax.car),
                ),
                Text("Hello world")
              ],
            ),
          );
        }
    );
  }
}