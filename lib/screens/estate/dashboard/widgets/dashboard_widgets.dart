import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../util/strings.dart';
import '../../../../widgets/custom_dividers.dart';
import '../../estate_setup/add_estate_units_screen.dart';

Widget AccountSetup(BuildContext context){
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w30),
    child: Column(
      children: [
        customDivider(height: Sizes.h20),
        Row(
          children: [
            CircleAvatar(
              radius: Sizes.w25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: Sizes.w30,
                color: Colors.blue.withOpacity(.5),
              ),
            ),
            customVerticalDivider(width: Sizes.w25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Account Setup',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.w20,
                            fontWeight: FontWeight.bold)),
                    customVerticalDivider(width: Sizes.w15),
                  ],
                ),

                customDivider(height: Sizes.h5),
                Text(propertySetupMsgTxt,
                    style: TextStyle(
                        color: Colors.black, fontSize: Sizes.w15)),
              ],
            ),
          ],
        ),
        customDivider(height: Sizes.h10),
        Padding(
          padding: const EdgeInsets.only(
              right: 28, bottom: 8, top: 8),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.defaultBlue.withOpacity(.8),
              //color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),

            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                highlightColor: Colors.blue.shade400,
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const AddEstateUnitsScreen()))
                },
                child: Center(
                  child: Text(
                    "Start Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        customDivider(height: Sizes.h10),
      ],
    ),
  );
}

optionMenu(BuildContext context, IconData iconPath, String item, Color boxColor, String link) {
  return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, link);
            },
            child: Container(
              height: Sizes.h100,

              decoration: BoxDecoration(
                  color: boxColor,
                  //border: Border.all(color: Colors.grey.withOpacity(.3)),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Center(
                child: Icon(
                  iconPath,
                  size: Sizes.w45, color: Colors.white,
                ),
              ),
            ),
          ),
          customDivider(height: Sizes.h13),
          Text(
            item,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.w18,
                ),
          )
        ],
      ));
}