import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../util/colors.dart';
import '../../../../../../util/size_model.dart';
import '../../../../../../widgets/custom_buttons.dart';
import '../../projects_list_screen.dart';

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({Key? key}) : super(key: key);

  @override
  State<CreateProjectForm> createState() => _CreateProjectFormState();
}

class _CreateProjectFormState extends State<CreateProjectForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilderTextField(
              name: "project_name",
              decoration: const InputDecoration(
                labelText: 'Project Name',
              ),
            ),
            FormBuilderTextField(
              name: "Description",
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            FormBuilderDateTimePicker(
              name: "Date",
              decoration: const InputDecoration(
                labelText: 'Due Date',
              ),
            ),
            FormBuilderTextField(
              name: "Amount",
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonText: "Create Project",
                buttonHeight: Sizes.h50,
                buttonColor: AppColors.defaultBlue),
          ],
        ),
      ),
    );
  }
  proceed() {
    final progress = ProgressHUD.of(context);
    progress?.showWithText('Creating Project...');
    Future.delayed(Duration(seconds: 4), () {
      progress?.dismiss();
      success();
    });
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
              height: Sizes.h350,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Sizes.h5, left: Sizes.w15, right: Sizes.w15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/svg/mini_success.json',repeat: false, height: 120),
                    SizedBox(height: 5,),
                    Text("Project Created Successfully", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),),
                    /*SizedBox(height: 30,),
                    Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.printer, buttonText: "Print"),
                            customVerticalDivider(width: Sizes.w15),
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Iconsax.import, buttonText: "Download"),
                            customVerticalDivider(width: Sizes.w15),
                            ButtonWidgets().utilityButton(context: context, function: print, icon: Icons.share_outlined, buttonText: "Share"),
                            SizedBox(height: 20,),
                          ],
                        )
                    ),*/
                    SizedBox(height: 7,),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProjectsListScreen()));
                        },
                        icon: Icon(
                          Iconsax.arrow_left,
                          color: AppColors.defaultBlue,
                        ),
                        label: Text(
                          'Back to Projects',
                          style: TextStyle(
                            color: AppColors.defaultBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w16,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  print(){

  }

}
