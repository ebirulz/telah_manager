import 'package:flutter/material.dart';
import 'package:manager/util/colors.dart';
import 'package:number_display/number_display.dart';
import '../util/size_model.dart';


class ButtonWidgets {
  final displayNumber = createDisplay(
    length: 19,
    decimal: 2,
    decimalPoint: '.',
  );

  customButton(
      {required BuildContext context,
        required Function function,
        double? buttonHeight,
        double? buttonTextSize,
        Color? buttonColor,
        String? buttonText,
        IconData? icon,
      }) {
        Sizes().heightSizeCalc(context);
        Sizes().widthSizeCalc(context);
        return SizedBox(
          height: buttonHeight ?? Sizes.h40,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
              onPressed: () {
                function();
              },
              child: Text(buttonText ?? 'Proceed',
                  style: TextStyle(fontSize: buttonTextSize ?? Sizes.w18))),
        );
      }


  utilityButton(
      {required BuildContext context,
        required Function function,
        double? buttonHeight,
        double? buttonTextSize,
        Color? buttonColor,
        String? buttonText,
        IconData? icon,
      }) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SizedBox.fromSize(
      size: Size(80, 80), // button width and height
      child: Container(
        child: Material(
          color: Colors.white, // button color
          //borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            splashColor: AppColors.borderLine.withOpacity(0.4), // splash color
            onTap: () {}, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.borderLine.withOpacity(0.15),
                  ),
                  child: Icon(icon, size: 30),
                ), // icon
                SizedBox(height: 10,),
                Text(buttonText!, style: TextStyle(fontSize: Sizes.w16),), // text
              ],
            ),
          ),
        ),
      ),
    );
  }


  IncidentContactButton(
      {required BuildContext context,
        required Function function,
        double? buttonHeight,
        double? buttonTextSize,
        Color? buttonColor,
        String? buttonText,
        IconData? icon,
      }) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SizedBox.fromSize(
      size: Size(150, 50), // button width and height
      child: Container(
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.borderLine)
          //color: AppColors.borderLine.withOpacity(0.15),
        ),*/
        child: Material(
         color: Colors.white, // button color
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            splashColor: AppColors.borderLine.withOpacity(0.4), // splash color
            onTap: () {}, // button pressed
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderLine.withOpacity(0.4)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(10),
                    child: Icon(icon, size: 30),
                  ), // icon
                  SizedBox(width: 10,),
                  Text(buttonText!, style: TextStyle(fontSize: Sizes.w16),), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mgmtButton(
    {required BuildContext context,
      required Function function,
      double? buttonHeight,
      double? buttonTextSize,
      Color? buttonColor,
      String? buttonText,
      IconData? icon,
    }) {
  Sizes().heightSizeCalc(context);
  Sizes().widthSizeCalc(context);
  return SizedBox(
    height: buttonHeight ?? Sizes.h100,
    width: double.infinity,
    child: Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
            onPressed: () {
              function();
            },
            child: Text(buttonText ?? 'Proceed',
                style: TextStyle(fontSize: buttonTextSize ?? Sizes.w18))),

        Text("Skip")
      ],
    )
  );
}