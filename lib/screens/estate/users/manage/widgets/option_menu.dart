import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_dividers.dart';
import '../edit_user_role_screen.dart';

List<Widget> userActionMenu(BuildContext context) {
  return [
    PopupMenuButton(

      onSelected: (result) {
        if (result == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditInvitedUserRole()));
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
                "Update Roles",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.cancel_outlined,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Remove User",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
      ],
    )
  ];
}