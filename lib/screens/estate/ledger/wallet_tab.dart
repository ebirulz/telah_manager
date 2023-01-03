/*
import 'package:flutter/material.dart';
 */
/*
import '../../../../util/colors.dart';
import '../../../../util/size_model.dart';
import '../widgets/transaction_card.dart';


class WalletTab extends StatefulWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 34),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Overview',
                style: TextStyle(
                  fontSize: Sizes.w20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _contentOverView(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Transactions',
                          style: TextStyle(
                          fontSize: Sizes.w20,
                          fontWeight: FontWeight.bold,
                       ),
                      ),
                  Text('See All', style: TextStyle(
                      fontSize: Sizes.w20,
                      fontWeight: FontWeight.bold,
                      ),
                   ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  TransactionCard(
                    color: Colors.black,
                    address: '115 Olive Drive',
                    name: 'Samuel Ochai',
                    date: 'Date: 12/05/2022',
                    price: '30,000',
                  ),
                  TransactionCard(
                    color: Colors.black,
                    address: '55 Maple Drive',
                    name: 'Kingsley Okafor',
                    date: 'Date: 12/05/2022',
                    price: '30,000',
                  ),
                  TransactionCard(
                    color: Colors.black,
                    address: '64 Clinton Drive',
                    name: 'Mary Abraham',
                    date: 'Date: 12/05/2022',
                    price: '30,000',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
     /* bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                //color: Color(0xFF015FFF),
                // borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: Text("ACTIVITY"),
              ),
              OutlineButton(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: Text("STATEMENTS"),
              ),
              OutlineButton(
                padding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                onPressed: () {},
                child: Text("DETAILS"),
              )
            ],
          ),
        ),
      ),*/
    );
  }

  Widget _contentOverView() {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.defaultBlue,
              const Color(0xFF36AAF7),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(10),
        //color: AppColors.defaultBlue2.withOpacity(1),
        // color: const Color(0xffF1F3F6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '₦20,600.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.w35,),

              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Current Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.w20,
                ),
              )
            ],
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

*/