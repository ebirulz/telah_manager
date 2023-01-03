import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

Widget UpcomingBill(BuildContext context,{String? TotalAmount, String? DueDate, String? UpcomingAmount}){
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.w15),
      side: new BorderSide(color: AppColors.borderLine, width: 0.3),
    ),
    clipBehavior: Clip.antiAlias,
    child: ExpansionTile(
      tilePadding: EdgeInsets.only(
          left: Sizes.w10, right: Sizes.w40, top: Sizes.h10),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AssetsPath.arrowDownIcon,
            width: Sizes.w20,
          ),
        ],
      ),
      title: Row(
        children: [
          Icon(Iconsax.receipt, size: Sizes.w30, color: Colors.black,),
          customVerticalDivider(width: Sizes.w15),
          Text('Upcoming Bill',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.w18,
                  color: Colors.black)),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15, left: Sizes.h3),
        child: Text(TotalAmount!,
            style:
            TextStyle(color: Colors.orange, fontSize: Sizes.w20, fontWeight: FontWeight.bold)),
      ),
      children: [
        const SizedBox(height: 10,),
        Padding(
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
                      color: Colors.blue.withOpacity(.2),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Iconsax.flash, size: Sizes.w30, color: AppColors.defaultBlue,),
                    ),
                  ),
                  customVerticalDivider(width: Sizes.w10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Subscription Charge',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.w18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DueDate!,
                        style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                      ),
                      Text(UpcomingAmount!,
                        style: TextStyle(
                            fontSize: Sizes.w16, fontWeight: FontWeight.bold, color: Colors.orange,),),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: Sizes.h5),
                        child: Container(
                            width: Sizes.w80,
                            decoration: BoxDecoration(
                              //color: AppColors.success,
                                borderRadius:
                                BorderRadius.all(Radius.circular(Sizes.w10))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: Sizes.h5, bottom: Sizes.h5),
                              child: Center(
                                  child: Text(
                                    'Pay Bill',
                                    style: TextStyle(
                                        fontSize: Sizes.w15, color: AppColors.success),
                                  )),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
      ],
    ),
  );
}
