import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';
import '../../property_unit/manage/property_unit_details_screen.dart';

class PropertyUnitCard extends StatefulWidget {
  final String address;
  final String propertyOccupant;

  PropertyUnitCard({
    required this.propertyOccupant,
    required this.address,
  });
  @override
  _PropertyUnitCardState createState() => _PropertyUnitCardState();
}

class _PropertyUnitCardState extends State<PropertyUnitCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyUnitDetailsScreen(),
            ),
          );
        },
        child: Container(
          height: 62.0,
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
                            Iconsax.house_2,
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
                          Text(widget.address, style: TextStyle( fontWeight: FontWeight.bold,),),
                          //Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.propertyOccupant)
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