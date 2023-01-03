import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:manager/screens/estate/expense/form/add_expense_form.dart';
import 'package:manager/widgets/app_bar.dart';

class RecordExpensesScreen extends StatefulWidget {
  const RecordExpensesScreen({Key? key}) : super(key: key);

  @override
  _RecordExpensesScreenState createState() => _RecordExpensesScreenState();
}

class _RecordExpensesScreenState extends State<RecordExpensesScreen> {
  late TextEditingController expenses;
  late TextEditingController datectrl;
  late TextEditingController amount;
  late TextEditingController tag;

  @override
  void initState() {
    super.initState();
    expenses = TextEditingController();
    datectrl = TextEditingController();
    amount = TextEditingController();
    tag = TextEditingController();
  }

  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Add Expenses'),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            name: "Description",
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),

                          FormBuilderDateTimePicker(
                            name: "Date",
                            decoration: const InputDecoration(
                              labelText: 'Date',
                            ),
                          ),
                          FormBuilderTextField(
                            name: "Amount",
                            decoration: const InputDecoration(
                              labelText: 'Amount',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonWidgets().customButton(
                              context: context,
                              function: proceed,
                              buttonText: "Record Expenses",
                              buttonHeight: Sizes.h50,
                              buttonColor: AppColors.defaultBlue),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),

    );
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Add Expenses'),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                AddExpenseForm(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
