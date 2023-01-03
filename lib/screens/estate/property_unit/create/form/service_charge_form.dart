import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';


class ServiceChargeForm extends StatefulWidget {
  const ServiceChargeForm({Key? key}) : super(key: key);

  @override
  State<ServiceChargeForm> createState() => _ServiceChargeFormState();
}

class _ServiceChargeFormState extends State<ServiceChargeForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            FormBuilderTextField(
              name: "Currency",
              decoration: const InputDecoration(
                labelText: 'NGN',
              ),
            ),
            FormBuilderTextField(
              name: "Amount",
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FormBuilderDateTimePicker(
              name: "start_date",
              decoration: const InputDecoration(
                labelText: 'Start Date',
                  suffixIcon: Icon(Iconsax.calendar)
              ),
            ),
            FormBuilderDateTimePicker(
              name: "end_date",
              decoration: const InputDecoration(
                labelText: 'End Date',
                suffixIcon: Icon(Iconsax.calendar)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
