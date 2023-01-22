import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../models/user_model.dart';
import '../../../../../providers/login_response_provider.dart';
import '../../../../../providers/user_provider.dart';
import '../../../../../providers/workspace_provider.dart';
import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../util/spacing.dart';
import '../../../../../widgets/app_bar.dart';
import '../../../dashboard/widgets/users_widget.dart';
import '../../../users/invite/invite_member_screen.dart';

class SettingsManageUsersScreen extends StatefulWidget {
  const SettingsManageUsersScreen({Key? key}) : super(key: key);

  @override
  State<SettingsManageUsersScreen> createState() =>
      _SettingsManageUsersScreenState();
}

class _SettingsManageUsersScreenState extends State<SettingsManageUsersScreen>
    with SingleTickerProviderStateMixin {
  String? selectedValue;

  late TabController _tabController;

  getUsers() async {
    final profile = Provider.of<LoginResponseProvider>(context, listen: false)
        .loginResponse;
    final prov = Provider.of<WorkspaceProvider>(context, listen: false);
    String workspaceId = prov.getWorkspace!['workspace']['workspaceId'];
    Provider.of<UserProvider>(context, listen: false)
        .fetch(workspaceId, profile.accessToken, state: false)
        .then((value) {
      Provider.of<UserProvider>(context, listen: false)
          .fetch(workspaceId, profile.accessToken, state: true);
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    getUsers();
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

    List<UserModel> users = Provider.of<UserProvider>(context).get;
    List<UserModel> invited = Provider.of<UserProvider>(context).invited;

    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget().appbar(
          context: context,
          title: 'Manage Users',
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
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
                                        bottom: BorderSide(
                                            color: AppColors.borderLine,
                                            width: .7),
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
                                              textCapitalization:
                                                  TextCapitalization.sentences,
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
                          SizedBox(
                            height: 20,
                          ),
                          Provider.of<UserProvider>(context).loading
                              ? Center(child: CircularProgressIndicator())
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: users.length,
                                    itemBuilder: (context, index) {
                                      return UsersWidget(
                                        name: users[index].name,
                                        email: users[index].email,
                                        role: users[index].roles[0]['name'],
                                        userModel: users[index],
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Provider.of<UserProvider>(context).loading
                              ? Center(child: CircularProgressIndicator())
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: invited.length,
                                    itemBuilder: (context, index) {
                                      return UsersWidget(
                                        name: invited[index].name,
                                        email: invited[index].email,
                                        role: invited[index].roles[0]['name'],
                                        userModel: invited[index],
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InviteMemberScreen()));
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
