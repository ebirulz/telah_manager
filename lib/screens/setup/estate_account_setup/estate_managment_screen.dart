import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/screens/setup/estate_account_setup/estate_role_screen.dart';
import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';
import 'components/forms/estate_management_form.dart';

class EstateManagementScreen extends StatefulWidget {
  const EstateManagementScreen({Key? key}) : super(key: key);

  @override
  State<EstateManagementScreen> createState() => _EstateManagementScreenState();
}

class _EstateManagementScreenState extends State<EstateManagementScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget().appbar(context: context,),
          body: ListView(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                      child: Center(
                          child: FAProgressBar(
                            currentValue: 10,
                            backgroundColor: const Color(0xffE3E6E8),
                            progressColor: AppColors.defaultBlue,
                            size: 9,
                          )),
                    ),
                    SvgPicture.asset(AssetsPath.formHouse, height: 60),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 250,
                      child: Text('Estate Management',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          )),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 300,
                      child:
                      Text('Is your estate managed by a facility management company? If Yes, enter the company name below',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EstateManagementForm(),
                    SizedBox(height: 40,),
                    Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                      child: SizedBox(
                        height: Sizes.h50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
                            onPressed: () {
                              proceed();
                            },
                            child: Text('Proceed',
                                style: TextStyle(fontSize: Sizes.w18))),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: TextButton(
                          onPressed: (){},
                          child: Text("Skip", style: TextStyle(fontSize: Sizes.w20, fontWeight: FontWeight.bold),)
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  proceed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EstateRoleScreen())
    );
  }
}