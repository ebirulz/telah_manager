import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/property_unit/manage/add_property_service_charge_screen.dart';
import 'package:manager/screens/estate/property_unit/manage/add_tenant_screen.dart';
import 'package:manager/screens/estate/property_unit/manage/member_history_screen.dart';

import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_dividers.dart';
import '../edit_property_unit_screen.dart';
import '../update_property_owner_screen.dart';

List<Widget> actionAppbar(BuildContext context) {
  return [
    PopupMenuButton(

      onSelected: (result) {
        if (result == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditPropertyUnitScreen()));
        } else if (result == 1) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTenantScreen()));
        } else if (result == 2) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MemberHistoryScreen()));
        }
        else if (result == 3) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddPropertyServiceChargeScreen()));
        }
        else if (result == 4) {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UpdateAdress()));*/
        }
        else if (result == 5) {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UpdateAdress()));*/
        }
        else if (result == 6) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditPropertyOwnerScreen()));
        }
        else if (result == 7) {
          /*Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const UpdateAdress()));*/
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
                "Edit Unit",
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
                Iconsax.add_square,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Add Tenant",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(
                Iconsax.clipboard_text,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Member History",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(
                Iconsax.add_square,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Add Service Charge",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              Icon(
                Iconsax.add_square,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Add Service Payment",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 5,
          child: Row(
            children: [
              Icon(
                Iconsax.add_square,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Add Off-app Payment",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 6,
          child: Row(
            children: [
              Icon(
                Iconsax.edit_2,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Edit Property Owner",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 7,
          child: Row(
            children: [
              Icon(
                Iconsax.edit_2,
                size: Sizes.w18,
                color: Colors.black,
              ),
              customVerticalDivider(width: Sizes.w10),
              Text(
                "Update Tenancy",
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w16),
              ),
            ],
          ),
        ),
      ],
    )
  ];
}