import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_dividers.dart';
import 'components/forms/account_email_form.dart';

class AccountEmailScreen extends StatefulWidget {

  final String optionSelected;
  const AccountEmailScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountEmailScreenState createState() => _AccountEmailScreenState();
}

class _AccountEmailScreenState extends State<AccountEmailScreen> {
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
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Center(
                        child: FAProgressBar(
                          currentValue: 60,
                          backgroundColor: const Color(0xffE3E6E8),
                          progressColor: Colors.blue,
                          size: 9,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 60,
                    child: Image.asset('assets/images/email.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text('Email Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("We won’t spam you, we promise",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Sizes.w15)),
                      customVerticalDivider(
                        width: 2
                      ),
                      SizedBox(
                        height: 20,
                        child: Image.asset('assets/images/finger.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AccountEmailForm(optionSelected: widget.optionSelected)
                ],
              ),
            ),
          ),
        ));
  }
}