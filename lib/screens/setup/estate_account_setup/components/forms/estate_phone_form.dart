import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class EstatePhoneForm extends StatefulWidget {
  const EstatePhoneForm({Key? key}) : super(key: key);

  @override
  _EstatePhoneFormState createState() => _EstatePhoneFormState();
}

class _EstatePhoneFormState extends State<EstatePhoneForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
              child: IntlPhoneField(
                initialCountryCode: 'NG',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              )
          ),
        ],
      ),
    );
  }


}
