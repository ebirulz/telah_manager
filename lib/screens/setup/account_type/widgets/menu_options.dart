import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:manager/util/size_model.dart';


accountTypeOptions(String title, String summary, String imagelink,
    Color titleColor, Color boxColor, Color borderColor) {
  return Padding(
    padding: EdgeInsets.only(bottom: Sizes.h8),
    child: SizedBox(
      height: Sizes.h120,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: Sizes.w20,
        ),
        child: Row(
          children: [
            Container(
              height: Sizes.h120,
              width: Sizes.w120,
              decoration: BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w10))),
              child: Center(
                child: SvgPicture.asset(
                  imagelink,
                  height: Sizes.h70,
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.transparent,
              width: Sizes.w20,
            ),
            SizedBox(
              width: Sizes.w211,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: titleColor,
                          fontSize: Sizes.w17,
                          fontWeight: FontWeight.bold)),
                  Divider(
                    color: Colors.transparent,
                    height: Sizes.h10,
                  ),
                  Flexible(
                    child: Text(summary,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}