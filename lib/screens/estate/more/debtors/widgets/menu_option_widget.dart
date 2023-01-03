import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_dividers.dart';
import '../generated_bills_screen.dart';

List<Widget> debtorActionMenu(BuildContext context) {
  return [
    PopupMenuButton(

      onSelected: (result) {
        if (result == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const GeneratedBillsScreen()));
        } /*else if (result == 1) {
          *//*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTenantScreen()));*//*
        }*/
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.w15))),
      icon: const Icon(Icons.more_vert, color: Colors.grey),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(
                Iconsax.receipt,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Generated Bills",
                style: TextStyle(color: Colors.black, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
      ],
    )
  ];
}