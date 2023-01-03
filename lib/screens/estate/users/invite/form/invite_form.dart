import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InviteForm extends StatefulWidget {
  const InviteForm({Key? key}) : super(key: key);

  @override
  State<InviteForm> createState() => _InviteFormState();
}

class _InviteFormState extends State<InviteForm> {

  final List<String> roleItems = [
    'Facility Manager',
    'Chairman',
    'Vice Chairman',
    'Secretary',
    'Financial Secretary',
    'Security Personnel',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          FormBuilderTextField(
            name:"email",
            decoration: InputDecoration(
                labelText: 'Email'
            ),
          ),
          SizedBox(height: 10,),
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
              'Please Select Your Role',
              style: TextStyle(fontSize: 14),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: roleItems
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
        ],
      ),
    );
  }
}

proceed(BuildContext context) {
  /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EstatePersonalDetailsScreen())
    );*/

}