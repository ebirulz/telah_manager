import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/payment/record_payment/record_payment.dart';
import 'package:manager/screens/estate/payment/manage/resolved_payments_screen.dart';
import 'package:manager/screens/estate/payment/manage/unresolve_payments_screen.dart';
import 'package:manager/screens/estate/payment/widget/payments_widgets.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../all_payments_screen.dart';

class ManagerPaymentScreen extends StatefulWidget {
  const ManagerPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ManagerPaymentScreen> createState() => _ManagerPaymentScreenState();
}

class _ManagerPaymentScreenState extends State<ManagerPaymentScreen> with SingleTickerProviderStateMixin {
  final List<String> monthItems = [
    'This Month',
    'Last Month',
  ];
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
        appBar: AppBarWidget().appbar(
          context: context,
          title: 'Payment History',
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
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
                      text: 'Off-App',
                    ),
                    Tab(
                      text: 'In-App',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8D79F3).withOpacity(.2),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        height: 80,
                                        width: 80,
                                        child: Icon(
                                          Iconsax.moneys,
                                          size: 40,
                                          color: Color(0xFF8D79F3),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => AllPaymentsScreen(),
                                          )
                                          );
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(left: 20),
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "All",
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontWeight:FontWeight.bold,
                                                      fontSize: Sizes.w20
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "All your payments will be recorded here",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.warningText.withOpacity(.2),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        height: 80,
                                        width: 80,
                                        child: Icon(
                                          Iconsax.moneys,
                                          size: 40,
                                          color: AppColors.warningText,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UnresolvedPaymentsScreen(),
                                          )
                                          );
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(left: 20),
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Unresolved",
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontWeight:FontWeight.bold,
                                                          fontSize: Sizes.w20
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(left: 15),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.errorText.withOpacity(0.2),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                                      ),
                                                      child: Text("34", style: TextStyle(color: AppColors.errorText, fontWeight: FontWeight.bold),),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Your unresolved payments will be recorded here",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.success.withOpacity(.2),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        height: 80,
                                        width: 80,
                                        child: Icon(
                                          Iconsax.moneys,
                                          size: 40,
                                          color: AppColors.success,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ResolvedPaymentsScreen(),
                                          )
                                          );
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(left: 20),
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Resolved",
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontWeight:FontWeight.bold,
                                                      fontSize: Sizes.w20
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Your resolved payments will be recorded here",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  SizedBox(height: 15,),
                                  Center(
                                    child: TextButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => RecordPaymentScreen(),
                                              )
                                          );

                                        },
                                        icon: Icon(
                                          Iconsax.add,
                                          color: AppColors.defaultBlue,
                                        ),
                                        label: Text(
                                          'Record Payment',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Sizes.w20,
                                            color: AppColors.defaultBlue,
                                          ),
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 110,
                              decoration: BoxDecoration(
                                color: AppColors.defaultBlue,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('N4,000,000.00',
                                          style: TextStyle(
                                            fontSize: Sizes.w25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            dropdownDecoration: BoxDecoration(
                                              border: Border.all(color: AppColors.borderLine),

                                            ),
                                            hint: Text(
                                              'Select Year',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                            items: monthItems
                                                .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ))
                                                .toList(),
                                            value: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value as String;
                                              });
                                            },
                                            buttonHeight: 40,
                                            buttonWidth: 97,
                                            itemHeight: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.calendar,
                                          size: 23,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Generate Statement",
                                          style: TextStyle(
                                            fontSize: Sizes.w18,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //PaymentHistoryList(),
                            SizedBox(height: 10,),
                            PaymentHistoryStatus(context,resolved: true),
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
