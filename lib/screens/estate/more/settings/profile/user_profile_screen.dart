import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/util/colors.dart';

import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_dividers.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final double coverHeight = 150;
  final double profileHeight = 100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  header() {
    return Container(
      width: double.infinity,
      height: coverHeight,
      decoration: BoxDecoration(
        color: AppColors.defaultBlue,
      ),
      child: Row(
        children: [
          Container(),
          Container()
        ],
      ),
    );
  }

  buildProfilePhoto(){
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage('https://www.ordary.com/assets/pages/media/profile/profile_user.jpg'),
    );
  }

  Widget buildTop(){
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: header(),
        ),
        Positioned(
            top: top,
            child: buildProfilePhoto()
        )
      ],
    );
  }

  buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Text("Ebimobowei John",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "johndoe@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Iconsax.home),
              customVerticalDivider(width: Sizes.w10),
              Text('First Name',
                  style:
                  TextStyle(color: Colors.grey, fontSize: Sizes.w13))
            ],
          ),
          customDivider(height: Sizes.h10),
          Text('Ebimobowei',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.w15)),
          customDivider(height: Sizes.h15),
          Row(
            children: [
              Icon(Iconsax.user),
              customVerticalDivider(width: Sizes.w10),
              Text('Last Name',
                  style:
                  TextStyle(color: Colors.grey, fontSize: Sizes.w13))
            ],
          ),
          customDivider(height: Sizes.h10),
          Text('John',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.w15)),
          customDivider(height: Sizes.h15),
          Row(
            children: [
              Icon(Iconsax.sms),
              customVerticalDivider(width: Sizes.w10),
              Text('Contact Email',
                  style:
                  TextStyle(color: Colors.grey, fontSize: Sizes.w13))
            ],
          ),
          customDivider(height: Sizes.h10),
          Text('johndoe@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.w15)),
          customDivider(height: Sizes.h15),
          Row(
            children: [
              Icon(Iconsax.call),
              customVerticalDivider(width: Sizes.w10),
              Text('Phone',
                  style:
                  TextStyle(color: Colors.grey, fontSize: Sizes.w13))
            ],
          ),
          customDivider(height: Sizes.h10),
          Text('+2348038474317',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.w15)),
        ],
      ),
    );
  }
}
