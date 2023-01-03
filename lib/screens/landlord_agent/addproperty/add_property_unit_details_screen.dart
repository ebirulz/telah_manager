import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../util/decor.dart';
import '../../../util/size_model.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_dividers.dart';
import 'add_property_unit_rent_fee_screen.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  List<PropertyItems> items = [
    PropertyItems(name: 'Room'),
    PropertyItems(name: 'Living rooms'),
    PropertyItems(name: 'Toilets'),
    PropertyItems(name: 'Kitchens'),
    PropertyItems(name: 'Penthhouse'),
    PropertyItems(name: 'Garage'),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    double totalWidth = MediaQuery.of(context).size.width;
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h50,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                
                LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .3,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Icon(Iconsax.category, size: Sizes.w30, color: Colors.black,),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Property details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Number of rooms, toilets, living rooms etc',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h30),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int i) {
                          return itemsgrid(totalWidth, node);
                        },
                        separatorBuilder: (BuildContext context, int i) {
                          return Container();
                        },
                        itemCount: items.length)),
                customDivider(height: Sizes.h20),
                ButtonWidgets().customButton(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addDetail() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.w20),
              topLeft: Radius.circular(Sizes.w20)),
        ),
        builder: (context) {
          return SizedBox(
            height: Sizes.h250,
            child: Padding(
              padding: EdgeInsets.only(top: Sizes.h30, left: Sizes.w15, right: Sizes.w15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add property detail',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                  ),
                  customDivider(height: Sizes.h25),
                  TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    textInputAction: TextInputAction.done,
                    decoration: Decor()
                        .formDecor(context: context, labelText: 'Name'),
                  ),
                  customDivider(height: Sizes.h25),
                  SizedBox(
                    height: Sizes.h50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: Decor().buttonDecor(context: context),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(fontSize: Sizes.w20),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }

  placeHold(double totalWidth, FocusNode node) {
    return Row(
      children: [
        SizedBox(
          width: (totalWidth / 2) - Sizes.w30,
          child: TextFormField(
            onChanged: (value) {
              if (value.trim().isEmpty) {
              } else {}
            },
            style: TextStyle(fontSize: Sizes.w13),
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            decoration:
                Decor().formDecor(context: context, labelText: 'Rooms'),
          ),
        ),
        customVerticalDivider(width: Sizes.w10),
        SizedBox(
          width: (totalWidth / 2) - Sizes.w30,
          child: TextFormField(
            onChanged: (value) {
              if (value.trim().isEmpty) {
              } else {}
            },
            style: TextStyle(fontSize: Sizes.w13),
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            decoration: Decor().formDecor(
                context: context, labelText: 'Toilets'),
          ),
        )
      ],
    );
  }

  itemsgrid(double totalWidth, FocusNode node) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: Sizes.w1,
            // childAspectRatio: Sizes.hd7,
            crossAxisCount: 2),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int int) {
          return SizedBox(
            width: (totalWidth / 2) - Sizes.w30,
            child: TextFormField(
              onChanged: (value) {
                if (value.trim().isEmpty) {
                } else {}
              },
              style: TextStyle(fontSize: Sizes.w13),
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(),
              decoration: Decor()
                  .formDecor(context: context, labelText: items[int].name),
            ),
          );
        });
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RentAmount()));
  }
}

class PropertyItems {
  String? name;
  String? content;
  PropertyItems({required this.name, this.content});
}
