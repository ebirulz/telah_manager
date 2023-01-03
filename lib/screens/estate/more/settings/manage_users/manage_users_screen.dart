import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../util/spacing.dart';
import '../../../../../widgets/app_bar.dart';
import '../../../dashboard/widgets/users_widget.dart';
import '../../../users/invite/invite_member_screen.dart';
class SettingsManageUsersScreen extends StatefulWidget {
  const SettingsManageUsersScreen({Key? key}) : super(key: key);

  @override
  State<SettingsManageUsersScreen> createState() => _SettingsManageUsersScreenState();
}

class _SettingsManageUsersScreenState extends State<SettingsManageUsersScreen> with SingleTickerProviderStateMixin {
  String? selectedValue;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(context: context,title: 'Manage Users',),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.defaultBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: AppColors.defaultBlue,
                  ),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: AppColors.borderLine.withOpacity(0.8),
                  tabs: [
                    Tab(
                      text: 'Active',
                    ),
                    Tab(
                      text: 'Invited',
                    ),
                    Tab(
                      text: 'All',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: FxSpacing.fromLTRB(10, 10, 15, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: FxSpacing.vertical(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          bottom: BorderSide(color: AppColors.borderLine, width: .7),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: FxSpacing.left(12),
                                            child: Icon(
                                              MdiIcons.magnify,
                                              color: AppColors.stepperBg,
                                              size: 28,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: FxSpacing.left(12),
                                              child: TextFormField(

                                                decoration: InputDecoration(
                                                  fillColor: AppColors.stepperBg,
                                                  hintText: "Search for users",
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  isDense: true,
                                                ),
                                                textCapitalization: TextCapitalization.sentences,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            UsersWidget(name: 'John Doe', email: 'john@gmail.com', role: 'Admin',),
                            UsersWidget(name: 'Ebimobowei Okpongu', email: 'ebi@gmail.com', role: 'Admin',),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            UsersWidget(name: 'Denis Power', email: 'john@gmail.com', role: 'Admin',),
                            UsersWidget(name: 'Ebimobowei Okpongu', email: 'ebi@gmail.com', role: 'Admin',),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InviteMemberScreen()));
          },
          elevation: 0,
          backgroundColor: AppColors.defaultBlue,
          label: Text('Invite User'),
          icon: const Icon(Icons.person_add_alt),
        ),
      ),
    );
  }
}