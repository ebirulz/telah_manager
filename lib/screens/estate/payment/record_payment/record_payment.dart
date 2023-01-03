import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manager/widgets/app_bar.dart';
import 'package:manager/widgets/custom_buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/colors.dart';
import '../../../../util/assets.dart';
import '../../../../util/size_model.dart';
import '../../../../util/spacing.dart';
import 'new_payment_screen.dart';

class RecordPaymentScreen extends StatefulWidget {
  const RecordPaymentScreen({Key? key}) : super(key: key);

  @override
  _RecordPaymentScreenState createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {

  var gender1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Record Payment'),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left:16, right: 16),
            child: ListView(
              children: [
                SvgPicture.asset(AssetsPath.userIcon, height: 50,),
                SizedBox(height: 20,),
                const SizedBox(
                  width: 250,
                  child: Text('Select Residence',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 23,
                      )),
                ),
                SizedBox(height: 20,),
                Text("Select resident to record payment"),
                SizedBox(height: 20,),
                Container(
                  margin: FxSpacing.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: FxSpacing.vertical(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.borderLine, width: .7),
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Container(
                                margin: FxSpacing.left(12),
                                child: Icon(
                                  MdiIcons.magnify,
                                  color: AppColors.stepperBg,
                                  size: 28,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: FxSpacing.left(12),
                                  child: TextFormField(

                                    decoration: InputDecoration(
                                      fillColor: AppColors.stepperBg,
                                      hintText: "Search for Properties and People",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                    ),
                                    textCapitalization: TextCapitalization.sentences,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                // RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
                Card(
                  margin: EdgeInsets.only(top: 10),
                  elevation: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: AppColors.defaultBlue,
                      focusColor: Colors.green,
                      selectedRowColor: Colors.green,
                      indicatorColor: Colors.green,
                      primaryColor: Colors.green,

                    ),
                    child: RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: Container(
                          width: Sizes.w50,
                          height: Sizes.h50,
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
                        title: Text(
                          'John Doe',
                          style: boldTextStyle(),
                        ),
                        subtitle: Text(
                          'Block 1, Room 2',
                          style: secondaryTextStyle(),
                        ),
                        value: 'Female',
                        groupValue: gender1,
                        onChanged: (dynamic value) {
                          setState(() {
                            gender1 = value;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonWidgets().customButton(
                context: context,
                function: proceed,
                buttonHeight: Sizes.h50,
                buttonColor: Colors.blue),
          ).paddingOnly(bottom: 20, right: 10, left: 10),
        ],
      ),
    );
  }
  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const NewPaymentScreen()));
  }

}


