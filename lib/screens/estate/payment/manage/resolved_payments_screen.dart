
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/payment/widget/payments_widgets.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';

class ResolvedPaymentsScreen extends StatefulWidget {
  const ResolvedPaymentsScreen({Key? key}) : super(key: key);

  @override
  State<ResolvedPaymentsScreen> createState() => _ResolvedPaymentsScreenState();
}

class _ResolvedPaymentsScreenState extends State<ResolvedPaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Unresolved payments',),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              //width: 150,
              child: InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Iconsax.setting_4,
                      size: 20,
                      color: AppColors.borderLine,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Filter by date",
                      style: TextStyle(
                        fontSize: Sizes.w18,
                        color: AppColors.borderLine,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            PaymentHistoryStatus(context,resolved: true),
            PaymentHistoryStatus(context,resolved: true),
            PaymentHistoryStatus(context,resolved: true),
            PaymentHistoryStatus(context,resolved: true),
          ],
        ),
      ),
    );
  }
}
