import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:manager/widgets/app_bar.dart';
import '../../../../util/size_model.dart';
import 'form/new_payment_form.dart';

class NewPaymentScreen extends StatefulWidget {
  const NewPaymentScreen({Key? key}) : super(key: key);

  @override
  State<NewPaymentScreen> createState() => _NewPaymentScreenState();
}

class _NewPaymentScreenState extends State<NewPaymentScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Record Payment'),
      body: ProgressHUD(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        width: Sizes.w80,
                        height: Sizes.h80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.w10),
                          color: Colors.blue.withOpacity(.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("JD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text("Ebimobowei Okpongu",
                        style: TextStyle(
                          fontSize: Sizes.w24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Block 1, Room 2"),
                      SizedBox(height: 15,),
                      RecordNewPaymentForm(),
                    ],
                  )
              ),
            ],
          ),
        ),
      )
    );
  }

}