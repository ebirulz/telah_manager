import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:manager/screens/estate/dashboard/manager_dashboard_screen.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_buttons.dart';
import '../../../../../widgets/custom_dividers.dart';


class RecordNewPaymentForm extends StatefulWidget {
  const RecordNewPaymentForm({Key? key}) : super(key: key);

  @override
  State<RecordNewPaymentForm> createState() => _RecordNewPaymentFormState();
}

class _RecordNewPaymentFormState extends State<RecordNewPaymentForm> {
  List<String> paymentType = ['Service Charge','Project'];
  List<String> serviceCharge = [];
  List<String> projectType = ['Road Construction', 'Street Light',];

  List<String> services = [];
  String? selectedPaymentType;
  String? selectedService;

  late TextEditingController amount;

  @override
  void initState() {
    super.initState();
    amount = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text('Payment Type'),
              value: selectedPaymentType,
              isExpanded: true,
              items: paymentType.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (country) {
                if (country == 'Project') {
                  services = projectType;
                } else if (country == 'Service Charge') {
                  services = serviceCharge;
                } else {
                  services = [];
                }
                setState(() {
                  selectedService = null;
                  selectedPaymentType = country!;
                });
              },
            ),
            // Country Dropdown Ends here
            SizedBox(height: 10.0),
            // Province Dropdown
            DropdownButton<String>(
              hint: Text('Select'),
              value: selectedService,
              isExpanded: true,
              items: services.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (service) {
                setState(() {
                  selectedService = service!;
                });
              },
            ),
            FormBuilderDateTimePicker(
              name: "payment date",
              decoration: const InputDecoration(
                  labelText: 'Payment Date ',
                  suffixIcon: Icon(Iconsax.calendar)
              ),
            ),
            SizedBox(height: 10,),
            FormBuilderTextField(
              name: "Amount",
              decoration: const InputDecoration(
                  labelText: 'Amount',
                  suffixIcon: Icon(Iconsax.moneys)
              ),
            ),
            SizedBox(height: 10,),
            FormBuilderTextField(
              name: "Reference",
              decoration: const InputDecoration(
                labelText: 'Reference',
              ),
            ),
            SizedBox(height: 20,),
            ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonText: "Record Payment",
                buttonHeight: Sizes.h50,
                buttonColor: Colors.blue),
          ],
        ),
      ),
    );
  }
  proceed() {
    /*Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const NewPaymentScreen()));*/
    final progress = ProgressHUD.of(context);
    progress?.showWithText('Recording Payment...');
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
              height: 380,
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

