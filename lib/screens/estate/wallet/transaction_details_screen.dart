import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({Key? key, Color? color, String? title, String? subTitle, String? price, String? letter}) : super(key: key);

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Welcome to details page"),
          ],
        ),
      ),
    );
  }
}
