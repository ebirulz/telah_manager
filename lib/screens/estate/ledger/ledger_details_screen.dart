import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/widgets/app_bar.dart';

import '../../../util/size_model.dart';

class LedgerDetailsScreen extends StatefulWidget {
  const LedgerDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LedgerDetailsScreen> createState() => _LedgerDetailsScreenState();
}

class _LedgerDetailsScreenState extends State<LedgerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context, title: 'Ledger Details'),
          body: Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service Charge Payment",
                    style: TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: Sizes.w20
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.withOpacity(.4)),
                      ),
                      height: 72,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.errorText.withOpacity(.2),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                padding: EdgeInsets.only(left: 8, right: 8),
                                height: 50,
                                child: Icon(
                                  Iconsax.profile_delete,
                                  color: AppColors.errorText,
                                  size: 30,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Debtors",
                                      style: TextStyle(
                                        fontSize: Sizes.w20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("See a list of service charge debtors")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                        indicatorColor: Colors.grey,
                        labelColor: AppColors.defaultBlue,
                        unselectedLabelColor: Colors.grey,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          Tab(text: "Summary"),
                          Tab(text: "Credit"),
                          Tab(text: "Debit"),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    height:  MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Balance",
                                style: TextStyle(
                                  fontSize: Sizes.w20,
                                  ),
                              ),
                              SizedBox(height: 15,),
                              Text("N4,000,000.00",style: TextStyle(
                                fontSize: Sizes.w20,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 15,),
                              Text(
                                  "Credit",
                                style: TextStyle(
                                  fontSize: Sizes.w20,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text("N4,000,000.00",style: TextStyle(
                                fontSize: Sizes.w20,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 15,),
                              Text("Debit",style: TextStyle(
                                fontSize: Sizes.w20,
                              ),),
                              SizedBox(height: 15,),
                              Text("N500,000.00",style: TextStyle(
                                fontSize: Sizes.w20,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              SizedBox(height: 15,),

                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Iconsax.setting_4,
                                    size: 25,
                                    color: AppColors.defaultBlue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                      fontSize: Sizes.w20,
                                      color: AppColors.defaultBlue,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //expandCh2(expire: true),
                             // expandCh2(expire: true),
                              //expandCh2(expire: true),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Iconsax.setting_4,
                                    size: 25,
                                    color: AppColors.defaultBlue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                      fontSize: Sizes.w20,
                                      color: AppColors.defaultBlue,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //expandCh2(expire: false),
                              //expandCh2(expire: false),
                              //expandCh2(expire: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}