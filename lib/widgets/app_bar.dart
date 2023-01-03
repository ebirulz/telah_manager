import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class AppBarWidget {
  final displayNumber = createDisplay(
    length: 19,
    decimal: 2,
    decimalPoint: '.',
  );
  appbar(
      {required BuildContext context,
        String? title,
        bool hasAction = false,
        List<Widget>? action}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(
        title ?? '',
        style:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      ),
      actions: hasAction ? action : [],
    );
  }
}