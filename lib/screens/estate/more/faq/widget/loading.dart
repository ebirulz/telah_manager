import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

Widget itemTitle(BuildContext context, var titleText, {var fontfamily = 14}) {
  return text(titleText, fontSize: 12, );
}

Widget text(
    var text, {
      var fontSize = 12,
      textColor = AppColors.defaultBlue,
      //var fontFamily = font_regular,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.1,
      var isLongText = false,
      var isJustify = false,
      var aDecoration,
    }) {
  return Text(
    text,
    textAlign: isCentered
        ? TextAlign.center
        : isJustify
        ? TextAlign.justify
        : TextAlign.start,
    maxLines: isLongText ? 20 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      //fontFamily: fontFamily,
      decoration: aDecoration != null ? aDecoration : null,
      fontSize: double.parse(fontSize.toString()).toDouble(),
      height: 1.5,
      color: textColor == AppColors.defaultBlue
          ? AppColors.success
          : textColor.toString().isNotEmpty
          ? textColor
          : null,
      letterSpacing: latterSpacing,
    ),
  );
}