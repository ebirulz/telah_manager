import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class EstateLocationForm extends StatefulWidget {
  const EstateLocationForm({Key? key}) : super(key: key);

  @override
  _EstateLocationFormState createState() => _EstateLocationFormState();
}
class _EstateLocationFormState extends State<EstateLocationForm> {

  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: 8),
            child: CSCPicker(
              ///Enable disable state dropdown [OPTIONAL PARAMETER]
              showStates: true,
              layout: Layout.vertical,

              /// Enable disable city drop down [OPTIONAL PARAMETER]
              showCities: true,

              ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
              flagState: CountryFlag.ENABLE,

              ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border:
                  Border.all(color: Colors.grey.shade300, width: 1)),

              ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
              disabledDropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                  border:
                  Border.all(color: Colors.grey.shade300, width: 1)),

              ///placeholders for dropdown search field
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",

              ///labels for dropdown
              countryDropdownLabel: "*Country",
              stateDropdownLabel: "*State",
              cityDropdownLabel: "*City",

              ///Default Country
              defaultCountry: DefaultCountry.Nigeria,

              ///Disable country dropdown (Note: use it with default country)
              //disableCountry: true,

              ///selected item style [OPTIONAL PARAMETER]
              selectedItemStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              ///DropdownDialog Heading style [OPTIONAL PARAMETER]
              dropdownHeadingStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),

              ///DropdownDialog Item style [OPTIONAL PARAMETER]
              dropdownItemStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              ///Dialog box radius [OPTIONAL PARAMETER]
              dropdownDialogRadius: 10.0,

              ///Search bar radius [OPTIONAL PARAMETER]
              searchBarRadius: 10.0,

              ///triggers once country selected in dropdown
              onCountryChanged: (value) {
                setState(() {
                  ///store value in country variable
                  countryValue = value;
                });
              },
              ///triggers once state selected in dropdown
              onStateChanged: (value) {
                setState(() {
                  ///store value in state variable
                  stateValue = value;
                });
              },
              ///triggers once city selected in dropdown
              onCityChanged: (value) {
                setState(() {
                  ///store value in city variable
                  cityValue = value;
                });
              },
            ),
          ),

        ],
      ),
    );
  }

}