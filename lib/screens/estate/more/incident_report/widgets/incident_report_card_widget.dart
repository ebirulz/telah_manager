import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

import '../../../../../util/size_model.dart';
import '../incident_details_screen.dart';

class IncidentReportCard extends StatefulWidget {
  late final String name;
  late final String description;
  late final String postedBy;
  late final String date;

  IncidentReportCard({
    required this.name,
    required this.description,
    required this.postedBy,
    required this.date,
  });

  @override
  State<IncidentReportCard> createState() => _IncidentReportCardState();
}

class _IncidentReportCardState extends State<IncidentReportCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
        Container(
          decoration: BoxDecoration(
            color: AppColors.warningText.withOpacity(.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 40,
          width: 40,
          child: Icon(
            Iconsax.warning_2,
            size: 20,
            color: AppColors.warningText,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncidentDetailsScreen(),
                )
            );
          },
          child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: Sizes.w20
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.description,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Reported by ",
                              style: TextStyle(color: Colors.grey)
                          ),
                          TextSpan(
                              text: widget.postedBy,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
                          ),

                        ]),
                      ),
                      SizedBox(width: 10,),
                      Text(widget.date)
                    ],
                  )
                ],
              )
          ),
        )
      ],
    );
  }
}

Widget IncidentCardUtility(){
  return Container(

    child: Row(
      children: [
        //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
        Container(
          decoration: BoxDecoration(
            color: AppColors.warningText.withOpacity(.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 40,
          width: 40,
          child: Icon(
            Iconsax.warning_2,
            size: 20,
            color: AppColors.warningText,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Theft Report',
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: Sizes.w20
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Reported by ",
                            style: TextStyle(color: Colors.grey, fontSize: Sizes.w13)
                        ),
                        TextSpan(
                            text: 'John Doe',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: Sizes.w12)
                        ),

                      ]),
                    ),
                    SizedBox(width: 10,),
                    Text('Today 4:35pm', style: TextStyle(fontSize: Sizes.w13))
                  ],
                )
              ],
            )
        ),
      ],
    ),
  );
}

Widget WitnessCardUtility({String? name, String? address})
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
            width: 200,
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
                Text(
                  address!,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,

                ),
              ],
            )
        ),
      )
    ],
  );
}