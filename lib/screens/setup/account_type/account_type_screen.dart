import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import '../../../widgets/app_bar.dart';
import '../agents_landlord_account_setup/account_agents_screen.dart';
import '../agents_landlord_account_setup/account_name_screen.dart';
import '../estate_account_setup/estate_name_screen.dart';
import 'widgets/menu_options.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({Key? key}) : super(key: key);

  @override
  _AccountTypeScreenState createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  Color box1 = Colors.transparent;
  Color box2 = Colors.transparent;
  Color box3 = Colors.transparent;
  Color title1 = AppColors.textBlack;
  Color title2 = AppColors.textBlack;
  Color title3 = AppColors.textBlack;
  Color border1 = Colors.grey.withOpacity(.2);
  Color border2 = Colors.grey.withOpacity(.2);
  Color border3 = Colors.grey.withOpacity(.2);
  Color selectColor = Colors.blue.withOpacity(.2);
  Color titleSelect = AppColors.defaultBlue;

  String optionSelected = "0";

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBarWidget().appbar(context: context,),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w10,
                right: Sizes.w10,
                bottom: Sizes.w10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Center(
                      child: FAProgressBar(
                        currentValue: 20,
                        backgroundColor: AppColors.stepperBg,
                        progressColor: AppColors.defaultBlue,
                        size: 9,
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: Text(
                      signUpWelcomeTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                )),
                Divider(
                  height: Sizes.h15,
                  color: Colors.transparent,
                ),
                const Text(
                  experienceTxt,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Divider(
                  height: Sizes.h40,
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      optionSelected = "1";
                      title1 = titleSelect;
                      box1 = selectColor;
                      border1 = AppColors.defaultBlue;
                      title2 = Colors.black;
                      box2 = Colors.transparent;
                      border2 = Colors.grey.withOpacity(.2);
                      title3 = Colors.black;
                      box3 = Colors.transparent;
                      border3 = Colors.grey.withOpacity(.2);
                    });
                  },
                  child: accountTypeOptions(agentsTxt, signUpAgentTxt,
                      AssetsPath.agentOption, title1, box1, border1),
                ),
                Divider(
                  height: Sizes.h15,
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      optionSelected = "2";
                      title2 = titleSelect;
                      box2 = selectColor;
                      border2 = AppColors.defaultBlue;
                      title1 = Colors.black;
                      box1 = Colors.transparent;
                      border1 = Colors.grey.withOpacity(.2);
                      title3 = Colors.black;
                      box3 = Colors.transparent;
                      border3 = Colors.grey.withOpacity(.2);
                    });
                  },
                  child: accountTypeOptions(landlordsTxt, signUpLandlordTxt,
                      AssetsPath.landlordOption, title2, box2, border2),
                ),
                Divider(
                  height: Sizes.h15,
                  color: Colors.transparent,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      optionSelected = "3";
                      title3 = titleSelect;
                      box3 = selectColor;
                      border3 = AppColors.defaultBlue;
                      title1 = Colors.black;
                      box1 = Colors.transparent;
                      border1 = Colors.grey.withOpacity(.2);
                      title2 = Colors.black;
                      box2 = Colors.transparent;
                      border2 = Colors.grey.withOpacity(.2);
                    });
                  },
                  child: accountTypeOptions(estatesTxt, signUpEstateTxt,
                      AssetsPath.estateOption, title3, box3, border3),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(left: Sizes.w25, right: Sizes.w25, bottom: Sizes.h12),
            child: ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonText: proceedTxt,
                buttonHeight: Sizes.h50,
                buttonColor: optionSelected == "0"
                    ? AppColors.buttonDisabled
                    : null),
          ),
        ),
      ),
    );
  }
  proceed() {
    print(optionSelected);
    if(optionSelected == "1"){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AccountAgentScreen(optionSelected: optionSelected)));
    }
    if(optionSelected == "2"){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AccountNameScreen(optionSelected: optionSelected)));
    }
    if(optionSelected == "3"){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EstateNameScreen()));
    }
  }
}