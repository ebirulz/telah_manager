import 'package:flutter/material.dart';
import 'package:manager/screens/estate/users/manage/widgets/option_menu.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';

class InvitedUserDetailsScreen extends StatefulWidget {
  const InvitedUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<InvitedUserDetailsScreen> createState() => _InvitedUserDetailsScreenState();
}

class _InvitedUserDetailsScreenState extends State<InvitedUserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Manage Invited User',action: userActionMenu(context),
          hasAction: true),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  width: Sizes.w80,
                  height: Sizes.h80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.w10),
                    color: AppColors.defaultBlue,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("EO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text("ebi.okpongu@gmail.com",
                  style: TextStyle(
                    fontSize: Sizes.w18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text("Date Invited"),
          SizedBox(height: 10,),
          Text("Apr 13, 2020", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
          SizedBox(height: 20,),
          Text("Date Activated"),
          SizedBox(height: 10,),
          Text("Apr 13, 2020", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),
          SizedBox(height: 20,),
          Text("Role"),
          SizedBox(height: 10,),
          Text("Admin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w16),),

        ],
      ),
    );
  }
}
