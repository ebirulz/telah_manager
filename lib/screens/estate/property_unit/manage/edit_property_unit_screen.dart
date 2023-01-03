import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';

class EditPropertyUnitScreen extends StatefulWidget {
  const EditPropertyUnitScreen({Key? key}) : super(key: key);

  @override
  State<EditPropertyUnitScreen> createState() => _EditPropertyUnitScreenState();
}

class _EditPropertyUnitScreenState extends State<EditPropertyUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(AssetsPath.formHouse, height: 60,),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: 250,
                  child: Text('Update Property Unit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      )
                  ),
                ),
                SizedBox(height: 20,),
                FormBuilderTextField(
                  name: "House Number",
                  decoration: const InputDecoration(
                    labelText: 'House Number',
                  ),
                ),
                FormBuilderTextField(
                  name: "streetName",
                  decoration: const InputDecoration(
                    labelText: 'Street Name',
                  ),
                ),
                FormBuilderTextField(
                  name: "Property Unit type",
                  decoration: const InputDecoration(
                    labelText: 'Property unit Type',
                  ),
                ),
                SizedBox(height: 30,),
                ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: AppColors.defaultBlue),
              ],
            ),
          ),
        ),
      ),
    );
  }
  proceed() {
    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EstateLocationScreen())
    );*/
  }
}
