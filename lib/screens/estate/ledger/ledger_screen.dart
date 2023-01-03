import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:manager/widgets/app_bar.dart';
import 'ledger_details_screen.dart';
import '../../../util/colors.dart';
import '../../../util/size_model.dart';


class LedgerScreen extends StatefulWidget {
  const LedgerScreen({Key? key}) : super(key: key);
  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().appbar(context: context, title: 'Ledgers'),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      //SvgPicture.asset(AssetsPath.settingsIcon, height: 100),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8D79F3).withOpacity(.2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 100,
                        width: 100,
                        child: Icon(
                          Iconsax.moneys,
                          size: 50,
                          color: Color(0xFF8D79F3),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LedgerDetailsScreen(),
                              )
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Service charge payments",
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight:FontWeight.bold,
                                      fontSize: Sizes.w20
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "See a list of service charge payments",
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                  ),
                                ),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(.2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 100,
                        width: 100,
                        child: Icon(
                          Iconsax.moneys,
                          size: 50,
                          color: AppColors.success,
                        ),
                      ),
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Project payments",
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight:FontWeight.bold,
                                      fontSize: Sizes.w20
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "See a list of project payments",
                                  maxLines: 3,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                  ),
                                ),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*TextButton.icon(
                      onPressed: () {

                      },
                      icon: Icon(
                        Iconsax.add,
                        color: AppColors.defaultBlue,
                      ),
                      label: Text(
                        'Add new ledger',
                        style: primaryTextStyle(),
                      )
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
