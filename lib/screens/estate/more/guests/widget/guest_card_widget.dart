import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/size_model.dart';

Widget PendingGuestCard({String? name, String? address, String? date})
{
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        width: Sizes.w40,
        height: Sizes.h40,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("JD",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            ),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            margin: EdgeInsets.only(left: 10),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: Sizes.w16
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      address!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                    SizedBox(width: 15,),
                    Text(
                      date!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                  ],
                )
              ],
            )
        ),
      )
    ],
  );
}

Widget OngoingGuestCard({String? name, String? address, String? date})
{
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        width: Sizes.w40,
        height: Sizes.h40,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(Iconsax.house_2)
        ),
      ),
      InkWell(
        onTap: (){
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            margin: EdgeInsets.only(left: 10),
            //width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: Sizes.w16
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      address!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                    SizedBox(width: 15,),
                    Text(
                      date!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                  ],
                )
              ],
            )
        ),
      )
    ],
  );
}

Widget EndedGuestCard({String? name, String? address, String? date})
{
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        width: Sizes.w40,
        height: Sizes.h40,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("JD",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            ),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            margin: EdgeInsets.only(left: 10),
            //width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: Sizes.w16
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      address!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                    SizedBox(width: 15,),
                    Text(
                      date!,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      softWrap: true,

                    ),
                  ],
                )
              ],
            )
        ),
      )
    ],
  );
}