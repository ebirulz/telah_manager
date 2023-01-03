import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/widgets/app_bar.dart';

import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';

class RemoveResidentDetailsScreen extends StatefulWidget {
  const RemoveResidentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RemoveResidentDetailsScreen> createState() => _RemoveResidentDetailsScreenState();
}

class _RemoveResidentDetailsScreenState extends State<RemoveResidentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Remove Resident'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: Sizes.h60,
                width: Sizes.h60,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.w10)),
                    color: Colors.blue.withOpacity(.3)),
                child: Center(
                  child: Text(
                    'JD',
                    style:
                    TextStyle(color: Colors.blue, fontSize: Sizes.w25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Ebimobowei Okpongu", textAlign: TextAlign.center, style: TextStyle( fontSize: Sizes.w22, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Block 1, Room 34", textAlign: TextAlign.center),
            SizedBox(height: 30,),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
              child: FormBuilderDateTimePicker(
                name: "move-out-date",
                decoration: const InputDecoration(
                    labelText: 'Set Move-out Date',
                    suffixIcon: Icon(Iconsax.calendar)
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ButtonWidgets().customButton(
                  context: context,
                  function: proceed,
                  buttonText: "Move-out Resident",
                  buttonHeight: Sizes.h50,
                  buttonColor: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
  proceed() {
    /*Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const NewPaymentScreen()));*/
  }
}
