import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manager/screens/welcome/intro_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../util/assets.dart';
import '../../util/colors.dart';
import '../../util/strings.dart';
import 'walkthrough_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int? isViewed = 0;

  startTime() async {
    var duration = const Duration(seconds: 9);
    return Timer(duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> navigationPage() async {
    if (isViewed != 0){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getInt('onBoard'));
      finish(context);
      const IntroScreen().launch(context);
    }
    else{
      finish(context);
      const OnBoardingScreen().launch(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.defaultBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SvgPicture.asset(AssetsPath.logoWhite, height: 43,),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(appSlogan, style: secondaryTextStyle(size: 14, color: Colors.white,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
