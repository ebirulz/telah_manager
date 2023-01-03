import 'package:flutter/material.dart';
import '../../../util/decor.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_billing_cycle_screen.dart';

class RentAmount extends StatefulWidget {
  const RentAmount({Key? key}) : super(key: key);

  @override
  State<RentAmount> createState() => _RentAmountState();
}

class _RentAmountState extends State<RentAmount> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h50,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey.withOpacity(.5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: .4,
                  ),
                  customDivider(height: Sizes.h50),
                  Center(
                    child: Image.asset(
                      'assets/icons/rent.png',
                      width: Sizes.w70,
                    ),
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Rent Amount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h15),
                  Text(
                    'Set rent for this property',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.w18,
                      height: 1.2,
                    ),
                  ),
                  customDivider(height: Sizes.h30),
                  TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsSeparatorInputFormatter()],
                    textInputAction: TextInputAction.done,
                    decoration: Decor().formDecor(
                        context: context,
                        labelText: 'Amount',
                        // suffix: Container(color: Colors.blue,)
                        suffix:  SizedBox(
                          width:  10,
                          height: 10,
                          child: Center(
                            child: ImageIcon(
                             const AssetImage('assets/icons/naira.png'),
                              size: Sizes.w20,
                            ),
                          ),
                        )
                        ),
                  ),
                  customDivider(height: Sizes.h300),
                  ButtonWidgets().customButton(
                      context: context,
                      function: proceed,
                      buttonHeight: Sizes.h50,
                      buttonColor: Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Billing()));
  }
}
