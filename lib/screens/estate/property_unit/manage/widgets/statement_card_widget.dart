import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';

Widget statementCardWidget(BuildContext context,{String? balance, Function? function}){
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 50,
    decoration: BoxDecoration(
      color: AppColors.defaultBlue,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16,),
        ),
        InkWell(
          onTap: (){
            function!();
          },
          child: Container(
            margin: EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.calendar,
                  size: 23,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Generate Statement",
                  style: TextStyle(
                    fontSize: Sizes.w18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}