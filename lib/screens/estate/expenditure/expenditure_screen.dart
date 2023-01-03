import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../widgets/custom_dividers.dart';
import 'widgets/expense_widget.dart';

import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../expense/add_expense_screen.dart';

class ExpenditureScreen extends StatefulWidget {
  const ExpenditureScreen({Key? key}) : super(key: key);

  @override
  State<ExpenditureScreen> createState() => _ExpenditureScreenState();
}

class _ExpenditureScreenState extends State<ExpenditureScreen> {
  final List<String> items = [
    '2020',
    '2021',
    '2022',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context, title: 'Expenditure'),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            dropdownDecoration: BoxDecoration(
                              border: Border.all(color: AppColors.borderLine),

                            ),
                            hint: Text(
                              'Select Year',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                            items: items
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Sizes.h100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.defaultBlue,
                          //border: Border.all(color: Colors.grey.withOpacity(.3)),
                          borderRadius:BorderRadius.all(Radius.circular(Sizes.w15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total Expenditure',
                                style: TextStyle(
                                    color: Colors.white, fontSize: Sizes.w20)),
                            customDivider(height: Sizes.h15),
                            Text('N2,000,000.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.w25)),

                            customDivider(height: Sizes.h5),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                              Tab(text: "Expenses"),
                              Tab(text: "Chart"),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          children: [
                            ExpensesList(),
                            Container(
                              child: Text("Coming soon"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RecordExpensesScreen()));
            },
            backgroundColor: AppColors.defaultBlue,
            child: const Icon(Icons.add),
          ),
        ),
    );
  }
}
