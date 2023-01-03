import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EstateManagementForm extends StatefulWidget {
  const EstateManagementForm({Key? key}) : super(key: key);

  @override
  State<EstateManagementForm> createState() => _EstateManagementFormState();
}

class _EstateManagementFormState extends State<EstateManagementForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "managed",
              decoration: const InputDecoration(
                labelText: 'Managed by',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
