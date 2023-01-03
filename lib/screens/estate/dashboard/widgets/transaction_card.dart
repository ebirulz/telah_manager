import 'package:flutter/material.dart';
//import '../../wallet/transaction_details_screen.dart';

class TransactionCard extends StatefulWidget {
  final String address;
  final String name;
  final String price;
  final String date;
  final Color color;
  TransactionCard({
    required this.color,
    required this.date,
    required this.price,
    required this.name,
    required this.address,
  });
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailsScreen(
                color: widget.color,
                title: widget.address,
                subTitle: widget.name,
                price: widget.price,
                letter: widget.date,
              ),
            ),
          );*/
        },
        child: Container(
          height: 62.0,
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Center(
                          child: Text(
                           "SE",
                            style: TextStyle(
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.address, style: TextStyle( fontWeight: FontWeight.bold,),),
                          //Text(widget.name),
                          Text(widget.date)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(widget.price, style: TextStyle(color: Colors.green, )),
                      SizedBox(width: 4.0),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 0.5,
                endIndent: 16.0,
                indent: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}