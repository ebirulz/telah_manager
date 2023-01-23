import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:manager/providers/user_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../../../providers/login_response_provider.dart';
import '../../../../providers/workspace_provider.dart';
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../dashboard/manager_dashboard_screen.dart';
import 'form/invite_form.dart';

import '../../../../widgets/app_bar.dart';

class InviteMemberScreen extends StatefulWidget {
  const InviteMemberScreen({Key? key}) : super(key: key);

  @override
  State<InviteMemberScreen> createState() => _InviteMemberScreenState();
}

class _InviteMemberScreenState extends State<InviteMemberScreen> {
  final _formkey = GlobalKey<FormBuilderState>();

  String? selectedValue;

  @override
  void initState() {
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);
    String workspaceId = prov.getWorkspace!['workspace']['workspaceId'];
    Provider.of<UserProvider>(context, listen: false).fetchRoles(workspaceId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context).roles);
    return Scaffold(
      appBar: AppBarWidget().appbar(
        context: context,
        title: 'Invite Member',
      ),
      body: ProgressHUD(
        child: Builder(
            builder: (context) => Center(
                  child: FormBuilder(
                    key: _formkey,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          /* child: Column(
                            children: [
                              InviteForm(),
                            ],
                          ), */
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                name: "email",
                                decoration: InputDecoration(labelText: 'Email'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required.';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Provider.of<UserProvider>(context).loading
                                  ? CircularProgressIndicator()
                                  //: DropdownButtonFormField2(
                                  : FormBuilderDropdown(
                                      name: 'role',
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
                                      /* buttonHeight: 60,
                                      buttonPadding: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ), */
                                      items: Provider.of<UserProvider>(context)
                                          .roles //roleItems
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item['name'],
                                                child: Text(
                                                  item['name'],
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: Sizes.h50,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Sizes.w10)))),
                                onPressed: () async {
                                  _formkey.currentState!.save();
                                  if (_formkey.currentState!.validate()) {
                                    final progress = ProgressHUD.of(context);

                                    ///progress?.showWithText('Inviting User...');
                                    //print(_formkey.currentState!.value);
                                    final profile =
                                        Provider.of<LoginResponseProvider>(
                                                context,
                                                listen: false)
                                            .loginResponse;
                                    final prov = Provider.of<WorkspaceProvider>(
                                        context,
                                        listen: false);
                                    String workspaceId =
                                        prov.getWorkspace!['workspace']
                                            ['workspaceId'];
                                    var data = {
                                      //'memberId': '${profile.id}',
                                      'email':
                                          _formkey.currentState!.value['email'],
                                      'roles': [
                                        _formkey.currentState!.value['role']
                                      ],
                                    };
                                    print(data);

                                    Map<String, dynamic> res =
                                        await Provider.of<UserProvider>(context,
                                                listen: false)
                                            .sendInvite(workspaceId, {});

                                    ///progress?.dismiss();
                                    /* Future.delayed(Duration(seconds: 4), () {
                                      progress?.dismiss();
                                      success();
                                      //success();
                                    }); */
                                  }
                                },
                                child: Text('Invite',
                                    style: TextStyle(fontSize: Sizes.w18))),
                          ),
                        ).paddingOnly(bottom: 20, right: 10, left: 10),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  success() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: 280,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h5, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/svg/mini_success.json',
                        repeat: false, height: 120),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "User invited successfully",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ManagerDashboard()));
                        },
                        icon: Icon(
                          Iconsax.arrow_left,
                          color: AppColors.defaultBlue,
                        ),
                        label: Text(
                          'Back to dashboard',
                          style: TextStyle(
                            color: AppColors.defaultBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w16,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
