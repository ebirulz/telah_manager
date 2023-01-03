import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

Widget NotificationListCard(BuildContext context,{String? message, String? estate_name, String? date})
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyUnitDetailsScreen(),
            ),
          );*/
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
                            Iconsax.notification4,
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
                          width: 200,
                          child:Text(message!, style: TextStyle( fontWeight: FontWeight.bold,),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(estate_name!)
                      ],
                    )
                  ],
                ),
                /*Row(
                    children: [
                      SizedBox(width: 4.0),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  )*/
                Text(date!)
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