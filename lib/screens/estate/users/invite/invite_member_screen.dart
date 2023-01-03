import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../dashboard/manager_dashboard_screen.dart';
import 'form/invite_form.dart';

import '../../../../widgets/app_bar.dart';

class InviteMemberScreen extends StatefulWidget {
  const InviteMemberScreen({Key? key}) : super(key: key);

  @override
  State<InviteMemberScreen> createState() => _InviteMemberScreenState();
}

class _InviteMemberScreenState extends State<InviteMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Invite Member',),
      body: ProgressHUD(
        child: Builder(
            builder: (context) => Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        InviteForm(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: Sizes.h50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
                          onPressed: () {
                            final progress = ProgressHUD.of(context);
                            progress?.showWithText('Inviting User...');
                            Future.delayed(Duration(seconds: 4), () {
                              progress?.dismiss();
                              success();
                              //success();
                            });
                          },
                          child: Text('Invite',
                              style: TextStyle(fontSize: Sizes.w18))),
                    ),
                  ).paddingOnly(bottom: 20, right: 10, left: 10),
                ],
              ),
            )
        ),
      ),
    );
  }

  success() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: 280,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h5, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/svg/mini_success.json',repeat: false, height: 120),
                    SizedBox(height: 5,),
                    Text("User invited successfully", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),),
                    SizedBox(height: 30,),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ManagerDashboard()));
                        },
                        icon: Icon(
                          Iconsax.arrow_left,
                          color: AppColors.defaultBlue,
                        ),
                        label: Text(
                          'Back to dashboard',
                          style: TextStyle(
                            color: AppColors.defaultBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w16,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
