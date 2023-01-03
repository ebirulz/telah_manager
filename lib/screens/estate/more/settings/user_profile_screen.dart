import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/colors.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  double? width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //changeStatusColor;
      //width = MediaQuery.of(context).size.width;
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              color: AppColors.defaultBlue,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white),
                      onPressed: () {
                        finish(context);
                      },
                    ),
                    Text("Account",),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: SvgPicture.asset( "", width: 25, height: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 80),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 60),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Ebimobowei Okpongu",),
                        Text("ebi.okpongu@gmail.com",),

                      ],
                    ),
                  ),
                  CircleAvatar(backgroundImage: AssetImage('assets/images/user.png') , radius: 50)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}