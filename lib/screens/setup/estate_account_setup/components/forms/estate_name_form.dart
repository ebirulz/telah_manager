import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EstateNameForm extends StatefulWidget {
  const EstateNameForm({Key? key}) : super(key: key);

  @override
  _EstateNameFormState createState() => _EstateNameFormState();
}

class _EstateNameFormState extends State<EstateNameForm> {
  late TextEditingController estateNameCtr;

  @override
  void initState() {
    super.initState();
    estateNameCtr = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Estate Name",
              decoration: const InputDecoration(
                labelText: 'Estate Name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}