import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../../../../widgets/app_bar.dart';
import 'form/create_project_form.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Create New Project',),
      body: ProgressHUD(
        child: ListView(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          children: [
            SizedBox(height: 20,),
            CreateProjectForm()
          ],
        ),
      )
    );
  }
}
