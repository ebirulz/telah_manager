import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../util/size_model.dart';
import '../../../../../../widgets/custom_dividers.dart';

List<Widget> ServiceActionAppbar(BuildContext context) {
  return [
    PopupMenuButton(

      onSelected: (result) {
        if (result == 0) {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditPropertyUnitScreen()));*/
        } else if (result == 1) {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTenantScreen()));*/
        }
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
                Iconsax.edit_2,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Edit",
                style: TextStyle(fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Iconsax.add_square,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Configure Bills",
                style: TextStyle(fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
      ],
    )
  ];
}