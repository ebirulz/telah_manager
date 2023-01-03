import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/screens/estate/property_unit/create/property_project_outstanding_bill_screen.dart';
import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';
import 'form/service_charge_form.dart';

class PropertyServiceChargeOutstandingScreen extends StatefulWidget {
  const PropertyServiceChargeOutstandingScreen({Key? key}) : super(key: key);

  @override
  State<PropertyServiceChargeOutstandingScreen> createState() => _PropertyServiceChargeOutstandingScreenState();
}
enum selectOption { no, yes }
class _PropertyServiceChargeOutstandingScreenState extends State<PropertyServiceChargeOutstandingScreen> {

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
          padding: const EdgeInsets.only(left:16, right: 16),
          child: Column(
            children: [
              Center(
                  child: FAProgressBar(
                    currentValue: 50,
                    backgroundColor: const Color(0xffE3E6E8),
                    progressColor: AppColors.defaultBlue,
                    size: 9,
                  )
              ),
              SizedBox(height: 20,),
              SvgPicture.asset(AssetsPath.formBill, height: 60,),
              SizedBox(height: 20,),
              const SizedBox(
                width: 300,
                child: Text(
                    'Service Charge Outstanding Bill Status',
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
                Text('Does this property have any outstanding service charge bill?',
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
                ServiceChargeForm(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyProjectOutstanding()));
  }
}