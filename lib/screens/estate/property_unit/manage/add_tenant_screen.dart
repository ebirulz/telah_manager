import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/screens/estate/property_unit/manage/form/add_tenant_form.dart';

import '../../../../util/assets.dart';
import '../../../../widgets/app_bar.dart';

class AddTenantScreen extends StatefulWidget {
  const AddTenantScreen({Key? key}) : super(key: key);

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(AssetsPath.formPersonalInfo, height: 60,),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                width: 250,
                child: Text('Add New Tenant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                    )),
              ),
              SizedBox(height: 10,),
              const SizedBox(
                width: 250,
                child: Text('Tell us about the new tenant',
                    textAlign: TextAlign.center,
                    ),
              ),
              SizedBox(height: 30,),
              AddTenantForm()
            ],
          ),
        ),
      ),
    );
  }
}
