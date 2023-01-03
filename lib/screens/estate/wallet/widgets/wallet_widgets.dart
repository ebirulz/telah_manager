import 'package:flutter/material.dart';

import '../../../../util/assets.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/custom_dividers.dart';

contentOverView() {
  return Container(
    height: Sizes.h180,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.defaultBlue,
              const Color(0xFF36AAF7),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
    child: Padding(
      padding:
      EdgeInsets.only(top: Sizes.h30, left: Sizes.w20, right: Sizes.w20, bottom: Sizes.h20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: TextStyle(
                        fontSize: Sizes.w20,
                        color: Colors.white.withOpacity(.7)),
                  ),
                  Row(
                    children: [
                      Text('Today',
                          style: TextStyle(
                              fontSize: Sizes.w18, color: Colors.white)),
                      customVerticalDivider(width: Sizes.w5),
                      ImageIcon(
                        const AssetImage(AssetsPath.env),
                        color: Colors.white,
                        size: Sizes.w15,
                      )
                    ],
                  )
                ],
              ),
              customDivider(height: Sizes.h16),
              Text('N 4,000,000',
                  style: TextStyle(
                      fontSize: Sizes.w25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageIcon(
                    const AssetImage(AssetsPath.env),
                    color: Colors.white,
                    size: Sizes.w15,
                  ),
                  customVerticalDivider(width: Sizes.w5),
                  Text('Generate Statement',
                      style: TextStyle(
                          fontSize: Sizes.w18, color: Colors.white)),
                ],
              ),
              Icon(
                Icons.visibility_off_outlined,
                color: Colors.white.withOpacity(.7),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}