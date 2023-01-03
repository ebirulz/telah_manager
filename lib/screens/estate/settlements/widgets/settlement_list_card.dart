import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

Widget SettlementList(BuildContext context, {String? amount, String? date, Function? function}){
  return InkWell(
    onTap: () {
      function!();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        //height: 79.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Center(
                          child: Icon(
                            Iconsax.receipt,
                            color: Colors.white,
                            size: 25,
                          )
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(amount!, style: TextStyle( fontWeight: FontWeight.bold,),),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(date!),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4.0),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.9),
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}

Widget SettlementDetails({String? initial,String? name,String? address, String? amount, String? date, String? description}){
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10, bottom: Sizes.h10),
    child: Column(
      children: [
        Row(
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
                    child: Text(initial!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),*/
                customVerticalDivider(width: Sizes.w10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.w16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      address!,
                      style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                    ),
                    Text(
                      description!,
                      style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              amount!,
              style: TextStyle(
                  fontSize: Sizes.w15, fontWeight: FontWeight.bold, color: AppColors.success),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.9),
          thickness: 0.5,
        )
      ],
    )
  );
}