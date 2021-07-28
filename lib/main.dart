import 'package:access_trade/screens/dashboard_page.dart';
import 'package:access_trade/screens/home_page.dart';
import 'package:access_trade/screens/intro_page.dart';
import 'package:access_trade/screens/lazada_page.dart';
import 'package:access_trade/screens/shopee_page.dart';
import 'package:access_trade/screens/tiki_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return GetMaterialApp(
      title: 'Discout CouponsModel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/dashboard", page: () => DashboardPage()),
        GetPage(name: "/shopee", page: () => ShopeePage()),
        GetPage(name: "/tiki", page: () => TikiPage()),
        GetPage(name: "/lazada", page: () => LazadaPage()),
      ],
    );
  }
}
