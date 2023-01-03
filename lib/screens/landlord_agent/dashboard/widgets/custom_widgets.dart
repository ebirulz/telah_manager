import 'package:flutter/material.dart';

import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';

import 'package:manager/widgets/custom_dividers.dart';

Widget todoWidget(BuildContext context, IconData icon, String title, String subtitle, String link) {
  return Padding(
    padding: EdgeInsets.only(right: Sizes.w15),
    child: Container(
      width: Sizes.w230,
      height: Sizes.h130,
      decoration: BoxDecoration(
          color: AppColors.defaultBlue,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, link);
                },
              child: Text(
                title,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20, color: Colors.white),
              ),
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
                TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w25)),
            customDivider(),
            Text(title, style: TextStyle(fontSize: Sizes.w15))
          ],
        ),
      ));
}



expandCh({bool? expire}) {
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10, bottom: Sizes.w10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: Sizes.w50,
              height: Sizes.h50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.w10),
                color: Colors.blue.withOpacity(.5),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("JD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            customVerticalDivider(width: Sizes.w10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.w20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Block 2, Room 5',
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                ),
              ],
            ),
          ],
        ),
        expire == true
            ? Text(
          '20 days',
          style: TextStyle(
              fontSize: Sizes.w15, fontWeight: FontWeight.bold),
        )
            : Text(
          'N2,000',
          style: TextStyle(
              fontSize: Sizes.w20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

expandCh2({bool? expire}) {
  return Padding(
    padding: EdgeInsets.only(right: Sizes.w10, bottom: Sizes.w10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: Sizes.w50,
              height: Sizes.h50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.w10),
                color: Colors.blue.withOpacity(.5),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("JD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            customVerticalDivider(width: Sizes.w10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.w20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Block 2, Room 5',
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                ),
              ],
            ),
          ],
        ),
        expire == true
            ? Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(.2),
            borderRadius:  BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            'N2,000',
            style: TextStyle(
                fontSize: Sizes.w20, fontWeight: FontWeight.bold,),
          ),
        )
            : Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.errorText.withOpacity(.8),
            borderRadius:  BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            'N2,000',
            style: TextStyle(
              fontSize: Sizes.w20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    ),
  );
}