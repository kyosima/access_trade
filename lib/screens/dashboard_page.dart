import 'package:access_trade/controllers/dashboard_controller.dart';
import 'package:access_trade/screens/home_page.dart';
import 'package:access_trade/screens/lazada_page.dart';
import 'package:access_trade/screens/shopee_page.dart';
import 'package:access_trade/screens/tiki_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            ShopeePage(),
            TikiPage(),
            LazadaPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          unselectedItemColor: Get.isDarkMode ? Colors.white : Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          currentIndex: controller.tabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Shopee',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: 'Tiki',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flash_on),
              label: 'Lazada',
            ),
          ],
        ),
      );
    });
  }
}
