import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../util/colors.dart';
import '../../../../../../util/size_model.dart';
import '../service_details_screen.dart';

Widget ServicesListCard(BuildContext context,{String? serviceName, String? billingCycle,}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(),
            ),
          );
      },
      child: Container(
        //height: 62.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /*Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        color: AppColors.defaultBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Center(
                          child: Icon(
                            Iconsax.folder,
                            color: Colors.white,
                            size: 25,
                          )
                      ),
                    ),*/
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child:Text(serviceName!, style: TextStyle( fontWeight: FontWeight.bold,),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        //Text(billingCycle!),
                        SizedBox(height: 5,),
                        //Text(amount!),
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
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}

Widget ServicePropertyTypeList({String? propertyType, String? amount}){
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      /*Container(
        width: Sizes.w40,
        height: Sizes.h40,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: AppColors.defaultBlue,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(Iconsax.house_2, color: Colors.white,)
        ),
      ),*/
      InkWell(
        onTap: (){
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            //margin: EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      propertyType!,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                  ],
                ),
                Text(
                  amount!,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: Sizes.w16
                  ),
                ),
              ],
            )
        ),
      )
    ],
  );
}

Widget ServicesTransactionListCard(BuildContext context,{String? amount, String? address, String? date}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(),
          ),
        );
      },
      child: Container(
        //height: 62.0,
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
                        color: AppColors.defaultBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Center(
                          child: Icon(
                            Iconsax.user,
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
                        SizedBox(
                          width: 170,
                          child:Text(amount!, style: TextStyle( fontWeight: FontWeight.bold,),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(address!),
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
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}