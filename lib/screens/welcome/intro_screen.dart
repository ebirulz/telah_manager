import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:manager/screens/auth/sign_in/sign_in_screen.dart';
import '../../util/colors.dart';
import '../../util/strings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'data_protection_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  var isSuccess = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    //changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  void dispose() {
    // changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  void onSignInTap() async {
    await googleSignIn.signIn().then((res) async {
      await res!.authentication.then((accessToken) async {
        isSuccess = true;
        //appStore.setGoogleUserName(name: res.displayName);
        //appStore.setGoogleUserEmail(email: res.email);
        //appStore.setGoogleUserPhotoUrl(photoUrl: res.photoUrl);
        //await appStore.setValueGoogleSignIn(val: true);
        setState(() {});
        print('Access Token: ${accessToken.accessToken.toString()}');
      }).catchError((error) {
        isSuccess = false;
        setState(() {});
        throw (error.toString());
      });
    }).catchError((error) {
      isSuccess = false;
      setState(() {});
      throw (error.toString());
    });
  }

  void onSignOutTap() async {
    await googleSignIn.signOut().catchError((error) => throw (error.toString()));
    //await appStore.setValueGoogleSignIn(val: false);
    // appStore.setGoogleUserName(name: '');
    //appStore.setGoogleUserEmail(email: '');
    //appStore.setGoogleUserPhotoUrl(photoUrl: '');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: Text(userCreateAccountTxt, style: boldTextStyle(size: 28)),
          ),
          const SizedBox(height: 10),
          Center(
            child: const SizedBox(
              width: 250,
              child: Text(
                  userCreateAccountSubTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )
              ),
            ),
          ),
          const SizedBox(height: 60),
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/png/house.png'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
                left: 48, right: 48, bottom: 8, top: 8),
            child: Container(
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.defaultBlue,
                //color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),

              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  highlightColor: Colors.blue.shade400,
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const DataProtectionPolicyScreen()))
                  },
                  child: const Center(
                    child: Text(
                      proceedSignUpTxt,
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

          Padding(padding: const EdgeInsets.only(
              left: 48, right: 48, bottom: 8, top: 8),
            child: MaterialButton(
              onPressed: () {
                onSignInTap();
              },
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300)
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/png/google.png", width: 20,),
                  const Spacer(),
                  Text(googleSignUpTxt, style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500
                  ),),
                  const Spacer(),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                bottom: 24.0 + MediaQuery.of(context).padding.bottom,
                top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  haveAccountTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SignInScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      loginButtonTxt,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}