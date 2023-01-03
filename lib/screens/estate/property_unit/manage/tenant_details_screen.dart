import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';

class TenantDetailsScreen extends StatefulWidget {
  const TenantDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TenantDetailsScreen> createState() => _TenantDetailsScreenState();
}

class _TenantDetailsScreenState extends State<TenantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Tenant Details',),
    );
  }
}
