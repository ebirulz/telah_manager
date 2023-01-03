import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'package:manager/util/assets.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import '../../../util/colors.dart';
import 'components/forms/account_agent_form.dart';

class AccountAgentScreen extends StatefulWidget {
  final String optionSelected;
  const AccountAgentScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountAgentScreenState createState() => _AccountAgentScreenState();
}

class _AccountAgentScreenState extends State<AccountAgentScreen> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0.0,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                    child: Center(
                        child: FAProgressBar(
                          currentValue: 10,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: AppColors.defaultBlue,
                          size: 9,
                        )),
                  ),
                  SvgPicture.asset(AssetsPath.formPersonalInfo, height: 60,),
                  const SizedBox(
                    width: 250,
                    child: Text(agencyCreatedTxt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 21,
                        )),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text(signUpAcquaintedTxt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AccountAgentForm(optionSelected: widget.optionSelected)
                ],
              ),
            ),
          ),
        ));
  }
}
