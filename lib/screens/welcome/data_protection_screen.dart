import 'package:flutter/material.dart';
import '../../util/size_model.dart';
import '../../widgets/app_bar.dart';
import '../setup/account_type/account_type_screen.dart';

class DataProtectionPolicyScreen extends StatefulWidget {
  const DataProtectionPolicyScreen({Key? key}) : super(key: key);

  @override
  State<DataProtectionPolicyScreen> createState() => _DataProtectionPolicyScreenState();
}

class _DataProtectionPolicyScreenState extends State<DataProtectionPolicyScreen> {

  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Data Protection Policy',),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        children: [

          Text('TELAH GLOBAL LTD respects the privacy of our users. This Privacy Policy explains how we collect, use and safeguard your '
              'information when you use our mobile application (“TELAH App”).  Please read this Privacy Policy carefully. IF YOU DO NOT AGREE WITH '
              'THE TERMS OF THIS PRIVACY POLICY, PLEASE DO NOT ACCESS THE APPLICATION.', textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("Disclosure and Sharing of Information", style: TextStyle(fontWeight: FontWeight.bold,), ),
          SizedBox(height: 5,),
          Text("TELAH GLOBAL LTD does not rent, sell or disclose or share any Information that Service Provider collects from User, with "
              "third parties, save and except in order to provide User with the Services in accordance with the product functionality.", textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("Mobile Device Access", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("We may request access or permission to certain features from your mobile device, including your mobile device’s [camera, contacts, "
              "storage,] and other features. If you wish to change our access or permissions, you may do so in your device settings.", textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("Push Notifications" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("We may request to send you push notifications regarding your account or the Application. If you wish to opt-out from receiving "
              "these types of communications, you may turn them off in your device’s settings.", textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("User's Rights" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("The User retains rights to access, confirm, and review Personal Data User may have provided as well as correct Personal Data that "
              "may be inaccurate or irrelevant.", textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("Cookies and other Tracking Technologies" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("The app utilizes “cookies” and other Technical Information. “Cookies” are a small text file consisting of alphanumeric numbers "
              "used to collect the Information about the Platform activity. The Technical information helps Service Provider analyse web traffic "
              "and helps User by customizing the Platform to User's preferences. Cookies in no way gives Service Provider access to User's computer "
              "or mobile device. In relation to Cookies, User can deny access to the installation of the Cookies by modifying the settings on User's "
              "web browser, however, this may prevent User from taking full advantage of the Platform. The use of Cookies and Technical Information "
              "allows Service Provider to improve Platform and User's experience of Platform and Services.", textAlign: TextAlign.justify),
          SizedBox(height: 15,),
          Text("Data Security" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("Personal data collected upon registration are TITLE, NAME, GENDER, PROFILE PICTURE (OPTIONAL), PHONE NUMBER AND EMAIL ADDRESS. "
              "These details are never shared with a third party, with the exception of NAME AND EMAIL ADDRESS, which is used to create a NUBAN "
              "bank account for each user. The GENDER, TITLE AND PROFILE PICTURE are taken to provide a personalized experience to users on the app. "
              "The EMAIL ADDRESS AND PHONE NUMBER are also used for authentication and financial notifications. \n "
              "The UNIT ADDRESS, PHONE NUMBER, TITLE AND NAME of the primary resident are also captured for book-keeping purposes. This makes it "
              "possible for the Estate Manager to know which units are behind on their payment and to reach out where necessary. The resident’s "
              "phone number is also used to authenticate the resident. It is after authentication that each resident gets access to view bills, "
              "payments as well as invite guests with a code generated on the App. \n"
              "This information is securely stored in the cloud (AWS) where information security best practices are followed. Users are only able "
              "to view and/or modify data to which they have the required privileges. All user activities are also logged. To learn more on AWS "
              "please kindly visit: https://aws.amazon.com/security/" , textAlign: TextAlign.justify,),
          SizedBox(height: 15,),
          Text("Financial Data" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("Each user has a wallet from which in-app payments can be made for bills. Wallet top-up is as simple as making a bank transfer to your wallet NUBAN account number. This means you can make payment without sharing any card information.            Card payment is also supported and is powered by Flutterwave. TELAH does not save user’s card information. You can also contact Flutterwave or review their policy if you have more questions" , textAlign: TextAlign.justify,),
          SizedBox(height: 15,),
          Text("Use of Data" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("TELAH Global Ltd uses the collected data for various purposes including but not limited to the following:\n"
            "To provide customer care and support\n"
            "To notify you about changes to our Service\n"
            "To provide analysis or valuable information so that we can improve the Service\n"
            "To monitor the usage of the Service\n"
            "To provide and maintain the Service\n"
            "To allow you to participate in interactive features of our Service when you choose to do so\n"
            "To detect, prevent and address technical issues\n"
            "TELAH Global Ltd will not share with other parties, information which you may provide when using the Service, except where necessary, "
              "further to obtaining your consent."
            , textAlign: TextAlign.justify,),
          SizedBox(height: 15,),
          Text("Changes and updates to Policy" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("TELAH GLOBAL LTD may modify or revise the Privacy Policy from time to time and shall accordingly notify User of any changes"
              " to the Privacy Policy by posting the revised Privacy Policy on the Platform with an updated date of revision. "
              "User must periodically review the Privacy Policy for the latest information on Service Provider’s privacy practices. "
              "In the event User continues to use the Platform and Services after any update in the Privacy Policy, User's use of the Platform "
              "shall be subject to acceptance of the updated privacy policy." , textAlign: TextAlign.justify,),
          SizedBox(height: 15,),
          Text("Contact" , style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Text("Please feel free to reach out to TELAH by e-mail at info@telah.ng in case of any concerns, grievances, or questions relating to "
              "our privacy or data related practices." , textAlign: TextAlign.justify,),
          SizedBox(height: 20,),
          Row(
            children: [
              Material(
                child: Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value ?? false;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 250,
                child: const Text(
                  'I have read and accept terms and conditions',
                  //overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
              onPressed: agree ? proceed : null,
              child: const Text('I Agree'),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  proceed(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const AccountTypeScreen()));
  }
}
