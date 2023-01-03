import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';
import '../../payment/manage/unresolve_payments_screen.dart';
import '../../payment/manage/unresolved_payment_details_screen.dart';

Widget UnverifiedPayments(BuildContext context,{String? UnitsNumber, String? TotalAmount, String? Initials, String? Name, String? Address, String? Amount}){
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.w15),
      side: new BorderSide(color: AppColors.borderLine, width: 0.3),
    ),
    clipBehavior: Clip.antiAlias,
    child: ExpansionTile(
      tilePadding: EdgeInsets.only(
          left: Sizes.w10, right: Sizes.w10, top: Sizes.h10),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AssetsPath.arrowDownIcon,
            width: Sizes.w20,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.h5),
            child: Container(
                width: Sizes.w80,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F4),
                    borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.w10))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Sizes.h5, bottom: Sizes.h5),
                  child: Center(
                      child: Text(
                        UnitsNumber!,
                        style: TextStyle(
                            fontSize: Sizes.w15, color: Colors.black),
                      )),
                )),
          )
        ],
      ),
      title: Row(
        children: [
          Icon(Iconsax.receipt, size: Sizes.w30, color: Colors.black,),
          customVerticalDivider(width: Sizes.w15),
          Text('Unresolved Payments',
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
            TextStyle(color: AppColors.success, fontSize: Sizes.w20, fontWeight: FontWeight.bold)),
      ),
      children: [
        const SizedBox(height: 10,),
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnresolvedPaymentDetailsScreen(),
                )
            );
          },
          child: Padding(
            padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /*Container(
                      width: Sizes.w50,
                      height: Sizes.h50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.w10),
                        color: Colors.blue.withOpacity(.5),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(Initials!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    customVerticalDivider(width: Sizes.w10),*/
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.w17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Address!,
                          style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  Amount!,
                  style: TextStyle(
                      fontSize: Sizes.w15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),

        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnresolvedPaymentsScreen(),
                )
            );
          },
          child: Text("View All"),
        ),
        const SizedBox(height: 20,),
      ],
    ),
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
              fontSize: Sizes.w15, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}