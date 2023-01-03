import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';

class PwdRecoveryForm extends StatefulWidget {
  const PwdRecoveryForm({Key? key}) : super(key: key);

  @override
  State<PwdRecoveryForm> createState() => _PwdRecoveryFormState();
}

class _PwdRecoveryFormState extends State<PwdRecoveryForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: FormBuilderTextField(
              name: "Email",
              decoration: const InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Iconsax.sms),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
