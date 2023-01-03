import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../util/assets.dart';
import '../../util/strings.dart';
import 'intro_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool? isActive;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == pageChanged ? sDDotIndicator(isActive: true) : sDDotIndicator(isActive: false));
    }

    return list;
  }

  Widget sDDotIndicator({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: isActive ? 8.0 : 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 8.0 : 6.0,
      decoration: BoxDecoration(color: isActive ? Colors.blue : const Color(0xFF7E869B), borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    pageController.animateToPage(2, duration: const Duration(milliseconds: 600), curve: Curves.linear);
                  },
                  //splashColor: Colors.blue[50],
                  child: const Text(
                    appSkip,
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.7,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pageChanged = index;
                });
              },
              controller: pageController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05, left: 10, right: 10),
                      child: Lottie.asset('assets/svg/payment.zip', height: size.height * 0.4, fit: BoxFit.contain,width: size.width,repeat: false),
                      //child: SvgPicture.asset(AssetsPath.onBoarding1, height: size.height * 0.3, fit: BoxFit.contain,width: size.width,),
                      /*child: Image(
                        image: const AssetImage('assets/png/1.png'),
                        height: size.height * 0.3,
                        width: size.width,
                        fit: BoxFit.contain,
                      ),*/
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(mnSlidOne, textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text(mlSlideOneSubtitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                      child: SvgPicture.asset(AssetsPath.onBoarding2, height: size.height * 0.3, fit: BoxFit.contain,width: size.width,),
                      /*child: Image(
                        image: const AssetImage('assets/png/2.png'),
                        height: size.height * 0.3,
                        width: size.width,
                        fit: BoxFit.contain,
                      ),*/
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(mlSlideTwo, textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text(mlSlideTwoSubtitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05, left: 10, right: 10),
                      child: Lottie.asset('assets/svg/financial_report.json', height: size.height * 0.4, fit: BoxFit.contain,width: size.width,),
                      //child: SvgPicture.asset(AssetsPath.onBoarding3, height: size.height * 0.3, fit: BoxFit.contain,width: size.width,),
                      /*child: Image(
                        image: const AssetImage('assets/png/3.png'),
                        height: size.height * 0.3,
                        width: size.width,
                        fit: BoxFit.contain,
                      ),*/
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(mlSlideThree, textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text(mlSlideThreeSubtitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: buildDotIndicator()),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 17),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                pageChanged != 2
                    ? InkWell(
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                  onTap: () {
                    pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
                  },
                )
                    : Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, bottom: 0, top: 8),
                  child: Container(
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        highlightColor: Colors.blue.shade400,
                        onTap: () async {
                          await _storeOnboardInfo();
                          const IntroScreen().launch(context);
                        },
                        child: const Center(
                          child: Text(
                            getStarted,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
