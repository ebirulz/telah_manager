import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';

class EditInvitedUserRole extends StatefulWidget {
  const EditInvitedUserRole({Key? key}) : super(key: key);

  @override
  State<EditInvitedUserRole> createState() => _EditInvitedUserRoleState();
}

class _EditInvitedUserRoleState extends State<EditInvitedUserRole> {
  List? _userRoles;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userRoles = [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Update User Role',),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          FormBuilderTextField(
              name: "email",
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
      MultiSelectFormField(
        autovalidate: AutovalidateMode.disabled,
        chipBackGroundColor: Colors.blue,
        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
        checkBoxActiveColor: Colors.blue,
        checkBoxCheckColor: Colors.white,
        dialogShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: Text(
          "User Roles",
          style: TextStyle(fontSize: 16),
        ),
        validator: (value) {
          if (value == null || value.length == 0) {
            return 'Please select one or more options';
          }
          return null;
        },
        dataSource: [
          {
          "display": "Facility Manager",
          "value": "Facility Manager",
        },
          {
            "display": "Chairman",
            "value": "Chairman",
          },
          {
            "display": "Vice Chairman",
            "value": "Vice Chairman",
          },
          {
            "display": "Secretary",
            "value": "Secretary",
          },
          {
            "display": "Financial Secretary",
            "value": "Financial Secretary",
          },
          {
            "display": "Security Personnel",
            "value": "Security Personnel",
          },



        ],
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: Text('Please choose one or more'),
        initialValue: _userRoles,
        onSaved: (value) {
          if (value == null) return;
          setState(() {
            _userRoles = value;
          });
        },
      ),
          SizedBox(height: 20,),
          SizedBox(
            height: Sizes.h50,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(Sizes.w10)))),
                onPressed: () {

                },
                child: Text('Update',
                    style: TextStyle(fontSize: Sizes.w18))),
          ),
        ],
      ),
    );
  }
}
