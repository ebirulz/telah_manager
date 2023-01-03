import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:manager/util/assets.dart';

class FlareScreen extends StatefulWidget {
  const FlareScreen({Key? key}) : super(key: key);

  @override
  State<FlareScreen> createState() => _FlareScreenState();
}

class _FlareScreenState extends State<FlareScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: 280,
            width: 280,
            child: FlareActor(
              AssetsPath.animateDone,
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation:"done",
              //color: AppColors.success.withOpacity(0.2),
            ),
          )),
    );
  }
}
