import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:manager/util/assets.dart';
import 'package:manager/util/colors.dart';
import 'package:manager/util/size_model.dart';
import 'package:manager/util/strings.dart';
import 'account_created_screen.dart';
import 'components/widget/price_plan.dart';

class AccountSubscriptionScreen extends StatefulWidget {
  const AccountSubscriptionScreen({Key? key}) : super(key: key);

  @override
  _AccountSubscriptionScreenState createState() => _AccountSubscriptionScreenState();
}

class _AccountSubscriptionScreenState extends State<AccountSubscriptionScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text('Account Subscription', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 60,
                child: SvgPicture.asset(AssetsPath.userIcon),
              ),
              const SizedBox(
                width: 250,
                child: Text('Select subscription plan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                    )),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                //width: 250,
                child:
                Text('Link your account to an estate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 400,
                child:CustomPricePlan() ,
              ),


              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 8, top: 8),
                child: ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonText: proceedTxt,
                    buttonHeight: Sizes.h50,
                    buttonColor: AppColors.defaultBlue),
              ),

              const SizedBox(
                height: 30,
              )

            ],
          ),
        ),
      ),
    );
  }
  proceed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountCreatedScreen())
    );
  }

}
