import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';

class RadioCardList extends StatefulWidget {
  final String abv;
  final String name;
  final String address;
  final String valueTxt;

  RadioCardList({
    required this.abv,
    required this.name,
    required this.address,
    required this.valueTxt,
  });

  @override
  State<RadioCardList> createState() => _RadioCardListState();
}

class _RadioCardListState extends State<RadioCardList> {
  var resident;
  var groupVal;

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
    return RadioListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        secondary: Container(
          width: Sizes.w50,
          height: Sizes.h50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.w10),
            color: AppColors.defaultBlue,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(widget.abv,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white
              ),
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: boldTextStyle(),
        ),
        subtitle: Text(
          widget.address,
          style: secondaryTextStyle(),
        ),
        value: widget.valueTxt,
        groupValue: resident,
        onChanged: (dynamic value) {
          setState(() {
            resident = value;
          });
        });
  }
}

