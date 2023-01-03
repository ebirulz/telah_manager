import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../../../../../widgets/custom_dividers.dart';
import '../debtor_profile_screen.dart';

class DebtorsListWidget extends StatefulWidget {
  late final String name;
  late final String address;
  late final String amount;

  DebtorsListWidget({
    required this.name,
    required this.address,
    required this.amount,
  });

  @override
  State<DebtorsListWidget> createState() => _DebtorsListWidgetState();
}

class _DebtorsListWidgetState extends State<DebtorsListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DebtorProfileScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
        child: Container(
          //height: 62.0,
          width: 500.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          color: AppColors.defaultBlue,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Center(
                            child: Icon(
                              Iconsax.folder,
                              color: Colors.white,
                              size: 25,
                            )
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child:Text(widget.address, style: TextStyle( fontWeight: FontWeight.bold,),),
                          ),
                          //Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.name),
                          SizedBox(height: 5,),
                          Text(widget.amount, style: TextStyle(color: AppColors.errorText),)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 4.0),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget ProjectDebtorsListWidget(BuildContext context,{String? name, String? address, String? amount,Function? function}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        //height: 62.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        color: AppColors.defaultBlue,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Center(
                          child: Icon(
                            Iconsax.folder,
                            color: Colors.white,
                            size: 25,
                          )
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child:Text(address!, style: TextStyle( fontWeight: FontWeight.bold,),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(name!),
                        SizedBox(height: 5,),
                        Text(amount!, style: TextStyle(color: AppColors.errorText),)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4.0),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}

Widget TotalDebtorsAmountCardWidget(BuildContext context, {String? amount, Function? function, String? title,})
{
  return Container(
    height: Sizes.h150,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.errorText.withOpacity(.2),
      //border: Border.all(color: Colors.grey.withOpacity(.3)),
      borderRadius:BorderRadius.all(Radius.circular(Sizes.w15)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title!,
            style: TextStyle(
                color: AppColors.errorText, fontSize: Sizes.w16)),
        customDivider(height: Sizes.h15),
        Text(amount!,
            style: TextStyle(
                color: AppColors.errorText,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.w25)),

        customDivider(height: Sizes.h5),
        InkWell(
          onTap: (){
            function!();
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.calendar,
                  size: 23,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Generate Statement",
                  style: TextStyle(
                    fontSize: Sizes.w18,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),

        customDivider(height: Sizes.h5),
      ],
    ),
  );
}

Widget DebtorBillListWidget(BuildContext context, {String? amount, String? BillType, String? DateRange, Function? function}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        //height: 62.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child:Text(amount!, style: TextStyle( fontWeight: FontWeight.bold,color: AppColors.errorText, fontSize: Sizes.w18),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(BillType!),
                        SizedBox(height: 5,),
                        Text(DateRange!,)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4.0),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}

Widget DebtorGeneratedBillListWidget(BuildContext context, {String? amount, String? BillType, String? DateRange, Function? function}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        //height: 62.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child:Text(amount!, style: TextStyle( fontWeight: FontWeight.bold,color: AppColors.errorText, fontSize: Sizes.w18),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(BillType!),
                        SizedBox(height: 5,),
                        Text(DateRange!,)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4.0),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}

Widget DebtorPaidBillListWidget(BuildContext context, {String? amount, String? BillType, String? DateRange, Function? function}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        //height: 62.0,
        width: 500.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child:Text(amount!, style: TextStyle( fontWeight: FontWeight.bold,color: AppColors.success, fontSize: Sizes.w18),),
                        ),
                        //Text(widget.name),
                        SizedBox(height: 5,),
                        Text(BillType!),
                        SizedBox(height: 5,),
                        Text(DateRange!,)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4.0),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            )
          ],
        ),
      ),
    ),
  );
}