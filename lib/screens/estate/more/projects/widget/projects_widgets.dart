import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/colors.dart';

class ProjectListWidget extends StatefulWidget {

  late final String name;
  late final String date;
  late final String amount;

  ProjectListWidget({
    required this.name,
    required this.date,
    required this.amount,
  });


  @override
  State<ProjectListWidget> createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  @override
  Widget build(BuildContext context) {
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
                              Iconsax.folder,
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
                            child:Text(widget.name, style: TextStyle( fontWeight: FontWeight.bold,),),
                          ),
                          //Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.date)
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
                  Text(widget.amount, style: TextStyle(fontWeight: FontWeight.bold),)
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
