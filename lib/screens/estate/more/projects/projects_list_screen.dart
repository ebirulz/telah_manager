import 'package:flutter/material.dart';
import 'package:manager/screens/estate/more/projects/model/projects_model.dart';
import 'package:manager/screens/estate/more/projects/widget/projects_widgets.dart';

import '../../../../util/colors.dart';
import '../../../../widgets/app_bar.dart';
import 'create/create_project_screen.dart';

class ProjectsListScreen extends StatefulWidget {
  const ProjectsListScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsListScreen> createState() => _ProjectsListScreenState();
}

class _ProjectsListScreenState extends State<ProjectsListScreen> {
  late List RetrieveProjectList;
  @override
  void initState() {
    RetrieveProjectList = getProjectList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Projects',),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        children: [
          ProjectListWidget(
              name: "End of Year Party 2022",
              date: "Nov 30, 2022",
              amount: 'N50,000'
          ),
          ProjectListWidget(
              name: "External Road Construction for Estate Name",
              date: "Jan 30, 2022",
              amount: 'N500,000'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateProjectScreen()));
        },
        backgroundColor: AppColors.defaultBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
