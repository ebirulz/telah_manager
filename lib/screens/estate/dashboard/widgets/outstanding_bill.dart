import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';
import '../../wallet/bill_payment/bill_payment_option.dart';

Widget OutstandingBills(BuildContext context){
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.w20),
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
          Icon(Iconsax.wallet_2, size: Sizes.w30, color: Colors.black,),
          customVerticalDivider(width: Sizes.w15),
          Text('Outstanding Bill',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.w18,
                  color: Colors.black)),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15, left: Sizes.h3),
        child: Text('N120,000.00',
            style: TextStyle(color: AppColors.errorText, fontSize: Sizes.w20, fontWeight:FontWeight.bold)),
      ),
      children: [
        expandCh(context),
        const SizedBox(height: 10,),
      ],
    ),
  );
}

expandCh(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10),
    child: GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BillPaymentScreen()));
      },
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
                    'Overdue',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Pay Bill',
                    style: TextStyle(
                        fontSize: Sizes.w18, fontWeight: FontWeight.bold, color: AppColors.success),
                  ),
                ],
              )
            ],
          ),


        ],
      ),
    ),
  );
}