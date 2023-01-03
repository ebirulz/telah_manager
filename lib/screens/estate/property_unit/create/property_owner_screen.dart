import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manager/screens/estate/property_unit/create/property_service_charge_outstanding_screen.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';

class PropertyOwnerScreen extends StatefulWidget {
  const PropertyOwnerScreen({Key? key}) : super(key: key);

  @override
  State<PropertyOwnerScreen> createState() => _PropertyOwnerScreenState();
}

class _PropertyOwnerScreenState extends State<PropertyOwnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                  child: FAProgressBar(
                    currentValue: 50,
                    backgroundColor: const Color(0xffE3E6E8),
                    progressColor: AppColors.defaultBlue,
                    size: 9,
                  )
              ),
            ),
            SizedBox(height: 20,),
            SvgPicture.asset(AssetsPath.formHouse, height: 60,),
            SizedBox(height: 20,),
            const SizedBox(
              width: 250,
              child: Text(
                  'Property Owner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  )
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              //width: 250,
              child:
              Text('Enter the property owner details here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ),
            SizedBox(height: 15,),
            Form(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: "House Number",
                      decoration: const InputDecoration(
                        labelText: 'House Number',
                      ),
                    ),
                    SizedBox(height: 10,),
                    FormBuilderTextField(
                      name: "First Name",
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    SizedBox(height: 10,),
                    FormBuilderTextField(
                      name: "Last Name",
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    SizedBox(height: 10,),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',

                      ),
                      initialCountryCode: 'NG',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    //SizedBox(height: 10,),
                    FormBuilderTextField(
                      name: "Email",
                      decoration: const InputDecoration(
                        labelText: 'Email (Optional)',
                      ),
                    ),
                    /*SizedBox(height: 10,),
                    FormBuilderDateTimePicker(
                      name: "Move In Date",
                      decoration: const InputDecoration(
                          labelText: 'Move In Date ',
                          suffixIcon: Icon(Iconsax.calendar)
                      ),
                    ),*/
                    SizedBox(height: 40,),

                    ButtonWidgets().customButton(
                        context: context,
                        function: proceed,
                        buttonHeight: Sizes.h50,
                        buttonColor: Colors.blue),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyServiceChargeOutstandingScreen()));
  }

}
