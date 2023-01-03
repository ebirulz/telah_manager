// ignore_for_file: prefer_is_empty, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manager/util/size_model.dart';


class Decor {
  container(
      {required BuildContext context,
        double? bordercurve,
        Color? color,
        Color? borderColor}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.grey.withOpacity(.3)),
        color: color ?? Colors.white,
        borderRadius:
        BorderRadius.all(Radius.circular(bordercurve ?? Sizes.w20)));
  }

  buttonDecor(
      {Color? buttoncolor,
        Color? bordercolor,
        Color? elevationColor,
        double? elevation,
        double? bordercurver,
        @required BuildContext? context}) {
    double size = MediaQuery.of(context!).size.width;
    double w15 = size * .03546;
    return ElevatedButton.styleFrom(
        elevation: elevation,
        shadowColor: elevationColor,
        primary: buttoncolor,
        side: BorderSide(
          color: bordercolor ?? Colors.blue,
        ),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(bordercurver ?? w15))));
  }

  textStyle() {
    return const TextStyle();
  }

  formDecor(
      {required BuildContext context,
        String? labelText,
        Widget? suffix,
        Widget? prefixIcon,
        String? prefixText}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return InputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      labelText: labelText,
      labelStyle: TextStyle(fontSize: Sizes.w13),

      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.w10))),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  // ignore: override_on_non_overriding_member
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
