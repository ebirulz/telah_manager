import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/more/incident_report/widgets/incident_report_card_widget.dart';

import '../../../../util/size_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_buttons.dart';
import '../../../../widgets/custom_dividers.dart';

class IncidentDetailsScreen extends StatefulWidget {
  const IncidentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<IncidentDetailsScreen> createState() => _IncidentDetailsScreenState();
}

class _IncidentDetailsScreenState extends State<IncidentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Incident Report',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IncidentCardUtility(),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: Text("The incident om än dektiga. Mora vatt fena. Irade disamma, vigugon. Dalåll retrera. Speplalingar prell par. "
                  "\n \n Nyment tunyligen. Plas dons huruvida Katarina Berglund. Dining flitbonus. \n \n"
                  " Prende tavis Emma Danielsson. Makrodonat rev och Alice Lundström. Olle Jensen Gustav Nordin. Ingvar Nyberg. Krott sopspanare. \n \n"
                  " Prende tavis Emma Danielsson. Makrodonat rev och Alice Lundström. Olle Jensen Gustav Nordin. Ingvar Nyberg. Krott sopspanare. \n \n"
                  " Sertad monos. Lasade ter håna. Benyll sanas vadevis. Rende presat. Osam daponde som krott. Rune Nyström råde. Jessica Bergman.",
                style: TextStyle(fontSize: Sizes.w18),),
            ),
            SizedBox(height: 20,),
            Text("Witness", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w18),),
            WitnessCardUtility(
              name: 'Tony Clifford',
              address: '112 Olive Drive',
            ),
            WitnessCardUtility(
              name: 'Ijeoma Anthony',
              address: '112 Blu Drive',
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidgets().IncidentContactButton(
                    context: context,
                    function: print,
                    icon: Iconsax.sms,
                    buttonText: 'Send Message'
                ),
                customVerticalDivider(width: Sizes.w15),
                ButtonWidgets().IncidentContactButton(
                    context: context,
                    function: print,
                    icon: Iconsax.call,
                    buttonText: 'Phone Call'
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
