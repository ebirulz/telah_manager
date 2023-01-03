import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

import '../../../../util/spacing.dart';

Widget singleRow(BuildContext context,  {required String link, IconData? icon, String? title, String? subTitle,}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, link);
    },
    child: Padding(
      padding: FxSpacing.bottom(8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.borderLine.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            padding: EdgeInsets.all(12),
            child: Icon(
              icon,
              color: AppColors.defaultBlue,
              size: 20,
            ),
          ),
          FxSpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                FxSpacing.height(2),
                Text(subTitle!),
              ],
            ),
          ),
          FxSpacing.width(20),
          Icon(
            Icons.keyboard_arrow_right,
            size: 18,
          ),
        ],
      ),
    ),
  );
}