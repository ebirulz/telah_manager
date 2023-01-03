import 'package:flutter/material.dart';

import '../../../../../../util/size_model.dart';
import '../../../../property_unit/manage/property_unit_details_screen.dart';
import '../details_screen.dart';

Widget PropertyTypeList(BuildContext context, {String? propertyType, String? unitNumber, String? serviceCharge, String? billingCycle}){
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PropertyTypeDetailsScreen(),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
      //height: 62.0,
      width: 500.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(propertyType!, style: TextStyle( fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                          SizedBox(width: 15,),
                          Text(unitNumber!),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(serviceCharge!),
                      SizedBox(height: 5,),
                      Text(billingCycle!),
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
  );
}

Widget PropertyUnitList(BuildContext context, {String? address, String? name, String? abv}){
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PropertyUnitDetailsScreen(),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
      //height: 62.0,
      width: 500.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address!, style: TextStyle( fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                      SizedBox(height: 5,),
                      Text(name!),
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
  );
}

Widget PropertyServiceList(BuildContext context, {String? amount, String? name, String? cycle}){
  return Container(
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
    //height: 62.0,
    width: 500.0,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name!, style: TextStyle( fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
                    SizedBox(height: 5,),
                    Text(amount!),
                    SizedBox(height: 5,),
                    Text(cycle!),
                  ],
                )
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
          thickness: 0.5,
        )
      ],
    ),
  );
}