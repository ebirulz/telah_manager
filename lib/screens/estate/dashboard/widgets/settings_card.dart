
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/size_model.dart';

class GridSettings extends StatelessWidget {
  Items item1 = new Items(
      title: "Guests",
      subtitle: "",
      event: "",
      img: Iconsax.user
  );

  Items item2 = new Items(
    title: "Debtors",
    subtitle: "",
    event: "",
    img: Iconsax.money,
  );
  Items item3 = new Items(
    title: "Projects",
    subtitle: "",
    event: "",
    img: Iconsax.category,
  );
  Items item4 = new Items(
    title: "Messages",
    subtitle: "",
    event: "",
    img: Iconsax.message,
  );
  Items item5 = new Items(
    title: "Rent Expiry List",
    subtitle: "",
    event: "4 Items",
    img: Iconsax.document_text,
  );
  Items item6 = new Items(
    title: "Incident Report",
    subtitle: "",
    event: "",
    img: Iconsax.cloud_lightning,
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff453658;
    return Flexible(
      flex: 2,
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    data.img,
                    size: Sizes.w45, color: Colors.black,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  IconData img;
  Items({required this.title, required this.subtitle, required this.event, required this.img});
}
