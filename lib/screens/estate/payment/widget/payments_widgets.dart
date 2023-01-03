import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';
import '../manage/payment_details_screen.dart';
import '../manage/unresolved_payment_details_screen.dart';

Widget PaymentHistoryStatus(BuildContext context,{bool? resolved}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PaymentDetailsScreen()));

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
                  color: AppColors.defaultBlue.withOpacity(0.3),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("JD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.defaultBlue
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
                        fontSize: Sizes.w18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Jan 1, 2022 - Jan 31, 2022',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          resolved == true
              ? Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              'N2000',
              style: TextStyle(
                  fontSize: Sizes.w16, fontWeight: FontWeight.bold, color: AppColors.success),
            ),
          )
              : Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.warningText.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              'N2000',
              style: TextStyle(
                  fontSize: Sizes.w16, fontWeight: FontWeight.bold, color: AppColors.warningText),
            ),
          )
        ],
      ),
    ),
  );
}

Widget PaymentReject() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: (){},
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
                  color: AppColors.defaultBlue.withOpacity(0.3),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("JD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.defaultBlue
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
                        fontSize: Sizes.w18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Jan 1, 2022 - Jan 31, 2022',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.errorText.withOpacity(0.2)
            ),
            child: Text(
              'N2000',
              style: TextStyle(
                  fontSize: Sizes.w15, fontWeight: FontWeight.bold, color: AppColors.errorText),
            ),
          )
        ],
      ),
    ),
  );
}

Widget UnresolvedPaymentsListCard(BuildContext context,{String? name, String? date}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UnresolvedPaymentDetailsScreen()));

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
                  color: AppColors.defaultBlue.withOpacity(0.3),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("JD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.defaultBlue
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
                    name!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.w18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date!,
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.warningText.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              'N2000',
              style: TextStyle(
                  fontSize: Sizes.w16, fontWeight: FontWeight.bold, color: AppColors.warningText),
            ),
          )
        ],
      ),
    ),
  );
}