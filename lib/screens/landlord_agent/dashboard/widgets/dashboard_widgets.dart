import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/assets.dart';
import '../../../../util/size_model.dart';
import '../../../../util/strings.dart';
import '../../../../widgets/custom_dividers.dart';
import '../../addproperty/add_property_unit_screen.dart';
import 'custom_widgets.dart';

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
                            color: Colors.blue.withOpacity(.5),
                            fontSize: Sizes.w20,
                            fontWeight: FontWeight.bold)),
                    customVerticalDivider(width: Sizes.w15),
                  ],
                ),

                customDivider(height: Sizes.h5),
                Text(accountSetupMsgTxt,
                    style: TextStyle(
                        color: Colors.grey, fontSize: Sizes.w15)),
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
            decoration: const BoxDecoration(
              color: AppColors.defaultBlue,
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
                          const AddProperty()))
                },
                child: Center(
                  child: Text(
                    addPropertyUnitTxt,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
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

Widget UnpaidBills(){
  return Card(
     elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.w20),
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
                        '42 units',
                        style: TextStyle(
                            fontSize: Sizes.w15, color: Colors.black),
                      )),
                )),
          )
        ],
      ),
      title: Row(
        children: [
          Icon(Iconsax.wallet_2, size: Sizes.w30, color: Colors.black,),
          customVerticalDivider(width: Sizes.w15),
          Text('Unpaid bills',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.w20,
                  color: Colors.black)),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15, left: Sizes.h3),
        child: Text('N8,000,001',
            style: TextStyle(color: AppColors.errorText, fontSize: Sizes.w20, fontWeight:FontWeight.bold)),
      ),
      children: [
        expandCh(),
        const SizedBox(height: 10,),
        expandCh(),
        const SizedBox(height: 10,),
        expandCh(),
        const SizedBox(height: 10,),
      ],
    ),
  );
}

Widget ExpiringSoon(){
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
                        '42 units',
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
          Text('Expiring Soon',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.w20,
                  color: Colors.black)),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15, left: Sizes.h3),
        child: Text('N4,200,000',
            style:
            TextStyle(color: Colors.orange, fontSize: Sizes.w20, fontWeight: FontWeight.bold)),
      ),
      children: [
        const SizedBox(height: 10,),
        expandCh(expire: true),
        const SizedBox(height: 10,),
        expandCh(expire: true),
        const SizedBox(height: 10,),
        expandCh(expire: true),
      ],
    ),
  );
}