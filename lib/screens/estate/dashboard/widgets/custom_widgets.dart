import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

Widget todoWidget(BuildContext context,IconData icon, String title, String subtitle, String link) {
  return Padding(
    padding: EdgeInsets.only(right: Sizes.w15),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, link);
      },
      child: Container(
        width: Sizes.w230,
        height: Sizes.h130,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.defaultBlue,
                  const Color(0xFF36AAF7),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            //color: AppColors.defaultBlue.withOpacity(1),
            //border: Border.all(color: Colors.grey.withOpacity(.3)),
            borderRadius: BorderRadius.all(Radius.circular(Sizes.w10))),
        child: Padding(
          padding: EdgeInsets.only(left: Sizes.w15, right: Sizes.w10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30.0,
              ),
              /*SvgPicture.asset(
              icon,
              width: Sizes.w20,
              //height: Sizes.h30,
            ),*/
              customDivider(height: Sizes.h7),
              Text(
                title,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20, color: Colors.white),
              ),

              customDivider(height: Sizes.h5),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: Sizes.w15, ),
                //textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    )
  );
}

units(int unit, String title) {
  return Expanded(
      child: Container(
        height: Sizes.h70,
        //color: const Color(0xFFF1F3F4),
        decoration: const BoxDecoration(
            color: const Color(0xFFF1F3F4),
          //color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(unit.toString(),
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20)),
            customDivider(),
            Text(title, style: TextStyle(fontSize: Sizes.w15))
          ],
        ),
      ));
}

