import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';
import '../../dashboard/manager_dashboard_screen.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({Key? key}) : super(key: key);

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        //margin: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilderTextField(
                name: "Purpose",
                decoration: const InputDecoration(
                  labelText: 'Purpose',
                ),
              ),
              FormBuilderTextField(
                name: "Beneficiary",
                decoration: const InputDecoration(
                  labelText: 'Beneficiary',
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
    );
  }
  proceed() {
    final progress = ProgressHUD.of(context);
    progress?.showWithText('Recording Expenses...');
    Future.delayed(Duration(seconds: 4), () {
      progress?.dismiss();
      success();
    });
  }

  success() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: Sizes.h350,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h5, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/svg/mini_success.json',repeat: false, height: 120),
                    SizedBox(height: 5,),
                    Text("Payment has been recorded", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),),
                    SizedBox(height: 30,),
                    Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                            customVerticalDivider(width: Sizes.w15),
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.import, buttonText: "Download"),
                            customVerticalDivider(width: Sizes.w15),
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                            SizedBox(height: 20,),
                          ],
                        )
                    ),
                    SizedBox(height: 7,),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ManagerDashboard()));
                        },
                        icon: Icon(
                          Iconsax.arrow_left,
                          color: AppColors.defaultBlue,
                        ),
                        label: Text(
                          'Back to dashboard',
                          style: TextStyle(
                            color: AppColors.defaultBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w16,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  print(){

  }
}
