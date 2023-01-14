import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/colors.dart';
import '../../../../../util/size_model.dart';
import '../property_owner_screen.dart';
import '../tenant_details_screen.dart';
import '../transaction_details_screen.dart';

Widget PropertyOwner(BuildContext context,
    {String? name, String? percentage, String? abv, String? email}) {
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      Container(
        margin: EdgeInsets.only(top: 5),
        width: Sizes.w40,
        height: Sizes.h40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            abv!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UnitPropertyOwnerScreen(),
              ));
        },
        child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          //color: AppColors.errorText.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: AppColors.borderLine.withOpacity(0.3))),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          percentage!,
                          style: TextStyle(
                              color: AppColors.defaultBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  email!,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(),
                ),
              ],
            )),
      )
    ],
  );
}

Widget UnitUnpaidBill(double amount) {
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        decoration: BoxDecoration(
          color: AppColors.warningText.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 100,
        width: 100,
        child: Icon(
          Iconsax.moneys,
          size: 50,
          color: AppColors.warningText,
        ),
      ),
      InkWell(
        onTap: () {
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Unpaid Bills",
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.errorText.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "N${amount}",
                          style: TextStyle(
                              color: AppColors.errorText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  //"Sum total of unpaid bills by this property unit will be recorded here. This includes both projects and service charge.",
                  "Sum total of Projects and Service Charge unpaid bill by this property unit will be recorded here.",
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            )),
      )
    ],
  );
}

Widget Tenants(BuildContext context,
    {String? abv, String? name, String? email, String? percentage}) {
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        margin: EdgeInsets.only(top: 7),
        width: Sizes.w40,
        height: Sizes.h40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            abv!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TenantDetailsScreen(),
              ));
        },
        child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.w16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          //color: AppColors.errorText.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: AppColors.borderLine.withOpacity(0.3))),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          percentage!,
                          style: TextStyle(
                              color: AppColors.defaultBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  email!,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(),
                ),
              ],
            )),
      )
    ],
  );
}

UnitTransaction(BuildContext context, Map<String, dynamic> transaction) {
  return Padding(
    padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10, top: Sizes.w13),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print(transaction);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyTransactionDetailsScreen(),
                ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${transaction['ledgerType'] == 'AMENITY' ? (transaction['amenityBill']?['amenity']['name']) : transaction['ledgerType'] == 'PROJECT' ? transaction['project']['name'] : ''}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.w17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${transaction['effectiveAt']}',
                    style: TextStyle(
                        color: AppColors.borderLine, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: AppColors.borderLine.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            'N${transaction['amount']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

Widget PropertyOwnerUnpaidBill() {
  return Row(
    verticalDirection: VerticalDirection.up,
    children: [
      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
      Container(
        width: Sizes.w40,
        height: Sizes.h40,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.w10),
          color: Colors.blue.withOpacity(.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "SC",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                                  )
                              );*/
        },
        child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Service Charge",
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ],
                ),
                Text(
                  "N350.00",
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.w16,
                    color: AppColors.errorText,
                  ),
                ),
              ],
            )),
      )
    ],
  );
}
