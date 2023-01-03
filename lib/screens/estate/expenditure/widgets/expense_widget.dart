import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

Widget ExpensesList(){
  return ListView(
    children: [
      const SizedBox(height: 10,),
      expandCh(),
      const SizedBox(height: 10,),
      expandCh(),
      const SizedBox(height: 10,),
      expandCh(),
    ],
  );
}

expandCh({bool? expire}) {
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10),
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
                color: AppColors.defaultBlue,
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
              fontSize: Sizes.w15, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
