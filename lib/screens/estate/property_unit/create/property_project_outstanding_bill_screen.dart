import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/screens/estate/property_unit/create/form/project_outstanding_form.dart';
import 'package:manager/screens/estate/property_unit/create/property_payment_screen.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';

class PropertyProjectOutstanding extends StatefulWidget {
  const PropertyProjectOutstanding({Key? key}) : super(key: key);

  @override
  State<PropertyProjectOutstanding> createState() => _PropertyProjectOutstandingState();
}
enum selectOption { no, yes }
class _PropertyProjectOutstandingState extends State<PropertyProjectOutstanding> {
  selectOption? _options;
  bool _formFieldVisible = false;

  void handleSelection(selectOption? value) {
    setState(() {
      _options = value;
      _formFieldVisible = value == selectOption.yes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                child: Center(
                  child: FAProgressBar(
                    currentValue: 50,
                    backgroundColor: const Color(0xffE3E6E8),
                    progressColor: AppColors.defaultBlue,
                    size: 9,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SvgPicture.asset(AssetsPath.formBill, height: 60,),
              SizedBox(height: 20,),
              const SizedBox(
                width: 300,
                child: Text(
                    'Project Outstanding Bill Status',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    )
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child:
                Text('Does this property have any outstanding Project bill?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.stepperBg),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: AppColors.defaultBlue,
                  ),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      'No',
                    ),
                    value: selectOption.no,
                    groupValue: _options,
                    onChanged: handleSelection,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.stepperBg),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: AppColors.defaultBlue,
                  ),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      'Yes',
                    ),
                    value: selectOption.yes,
                    groupValue: _options,
                    onChanged: handleSelection,
                  ),
                ),
              ),
              if (_formFieldVisible)
                ProjectOutstandingForm(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyPaymentScreen()));
  }
}
