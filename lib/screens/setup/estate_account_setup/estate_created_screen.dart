import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import '../../estate/dashboard/manager_dashboard_screen.dart';

class EstateCreatedScreen extends StatefulWidget {
  const EstateCreatedScreen({Key? key}) : super(key: key);

  @override
  _EstateCreatedScreenState createState() => _EstateCreatedScreenState();
}

class _EstateCreatedScreenState extends State<EstateCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
                child: Lottie.asset('assets/svg/mini_success.json',repeat: false)
            ),
            10.height,
            const SizedBox(
              width: 300,
              child: Text(
                  estateSuccessTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
              ),
            ),
            SizedBox(height: 20,),
            //Padding(),
            /*Text(
              "Proceed to add a property unit",
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),*/
            50.height,
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 8, top: 8),
              child: ButtonWidgets().customButton(
                  context: context,
                  function: proceed,
                  buttonText: "Go to dashboard",
                  buttonHeight: Sizes.h50,
                  buttonColor: AppColors.defaultBlue),
            ),
          ],
        ),
      ),
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ManagerDashboard())
    );
  }
}
