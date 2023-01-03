import 'package:flutter/material.dart';
import 'util/routes.dart';
import 'util/strings.dart';
import 'package:flutter/services.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          fontFamily: 'Raleway',
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/splashscreen',
      routes: customRoutes,
    );
  }
}