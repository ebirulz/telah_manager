import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EstateEmailForm extends StatefulWidget {
  const EstateEmailForm({Key? key}) : super(key: key);

  @override
  _EstateEmailFormState createState() => _EstateEmailFormState();
}

class _EstateEmailFormState extends State<EstateEmailForm> {
  late TextEditingController emailCtr;

  @override
  void initState() {
    super.initState();
    emailCtr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Estate Email",
              decoration: const InputDecoration(
                labelText: 'Estate Email',
              ),
            ),
          ),
        ],
      ),
    );
  }


}