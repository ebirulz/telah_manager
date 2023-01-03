import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/colors.dart';

class MemberList extends StatefulWidget {

  final String name;
  final String status;
  final String date;

  MemberList({
    required this.name,
    required this.status,
    required this.date,
  });
  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
          height: 79.0,
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
                          Text(widget.name, style: TextStyle( fontWeight: FontWeight.bold,),),
                          //Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.status),
                          SizedBox(height: 5,),
                          Text(widget.date)
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
}
