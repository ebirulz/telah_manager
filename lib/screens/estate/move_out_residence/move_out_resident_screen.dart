import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/screens/estate/move_out_residence/resident_detail_screen.dart';
import 'package:manager/screens/estate/move_out_residence/widgets/radio_button_widget.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';
import '../../../widgets/app_bar.dart';

class RemoveResidentScreen extends StatefulWidget {
  const RemoveResidentScreen({Key? key}) : super(key: key);

  @override
  State<RemoveResidentScreen> createState() => _RemoveResidentScreenState();
}

class _RemoveResidentScreenState extends State<RemoveResidentScreen> {

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context,title: 'Move-Out Residence',),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          SvgPicture.asset(AssetsPath.userIcon, height: 50),
          SizedBox(height: 15,),
          const SizedBox(
            width: 250,
            child: Text('Select Residence',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 23,
                )),
          ),
          SizedBox(height: 5,),
          Text("Move out resident from your Estate", textAlign: TextAlign.center),
          SizedBox(height: 15,),
          FormBuilderTextField(
              decoration: InputDecoration(
                hintText: "Search for resident",
                prefixIcon: Icon(Iconsax.search_normal, size: 20),
              ),
              name: 'search'
          ),
          SizedBox(height: 15,),
          RadioCardList(
            abv: 'EO',
            name: 'Ebimobowei Okpongu',
            address: 'Block 1, Room 3',
            valueTxt: 'ebi',
          ),
          RadioCardList(
            abv: 'SO',
            name: 'Samuel Ochai',
            address: '114, Olive Drive',
            valueTxt: 'ebi',
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RemoveResidentDetailsScreen()));
        },
        backgroundColor: AppColors.defaultBlue,
        //child: const Icon(Icons.add),
        label: Text('Proceed'),
        icon: Icon(Iconsax.arrow_right),
      ),
    );
  }
}