import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../dashboard/manager_dashboard_screen.dart';


class PropertyUnitCreatedScreen extends StatefulWidget {
  const PropertyUnitCreatedScreen({Key? key}) : super(key: key);

  @override
  State<PropertyUnitCreatedScreen> createState() => _PropertyUnitCreatedScreenState();
}

class _PropertyUnitCreatedScreenState extends State<PropertyUnitCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              child: Lottie.asset('assets/svg/mini_success.json', repeat: false)
            ),
            10.height,
            const SizedBox(
              width: 300,
              child: Text(
                  "Done! Property unit has been added successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )
              ),
            ),
            SizedBox(height: 20,),
            //Padding(),
            Text(
              "Invite resident",
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            10.height,
            Text(
              "John Doe",
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            Text(
              "Room 5, Block 1, Sage Estate",
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            10.height,
            Container(
              padding: EdgeInsets.only(
                  left: 16, right: 16,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: Sizes.h50,
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.share_outlined, color: Colors.white,),
                  label: Text("Share Invitation Message", style: TextStyle(fontSize: Sizes.w18,),)
              ),
            ),
            SizedBox(height: 30,),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ManagerDashboard()));
                },
                icon: Icon(
                  Iconsax.arrow_left,
                  color: AppColors.defaultBlue,
                ),
                label: Text(
                  'Return to dashboard',
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
    );
  }
  proceed() {
    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ManagerDashboard())
    );*/
  }
}
