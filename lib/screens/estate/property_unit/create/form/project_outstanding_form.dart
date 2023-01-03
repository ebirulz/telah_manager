import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProjectOutstandingForm extends StatefulWidget {
  const ProjectOutstandingForm({Key? key}) : super(key: key);

  @override
  State<ProjectOutstandingForm> createState() => _ProjectOutstandingFormState();
}

class _ProjectOutstandingFormState extends State<ProjectOutstandingForm> {
  final List<String> projectItems = [
    'External Road Construction',
    'Internal Road Construction',
    'Landscaping',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
        DropdownButtonFormField2(
        decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
          contentPadding: EdgeInsets.zero,
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Select Project',
          style: TextStyle(fontSize: 14),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only( right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: projectItems
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select your role.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
      ),
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
