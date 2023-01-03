import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../../../util/size_model.dart';
import 'components/forms/account_phone_form.dart';


class AccountPhoneScreen extends StatefulWidget {
  final String optionSelected;
  const AccountPhoneScreen({Key? key, required this.optionSelected}) : super(key: key);

  @override
  _AccountPhoneScreenState createState() => _AccountPhoneScreenState();
}

class _AccountPhoneScreenState extends State<AccountPhoneScreen> {
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
                          currentValue: 80,
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
                    child: Image.asset('assets/images/phone.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text('Phone Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    //width: 250,
                    child:
                    Text('What is your phone number?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AccountPhoneForm(optionSelected: widget.optionSelected)
                ],
              ),
            ),
          ),
        ));
  }
}
