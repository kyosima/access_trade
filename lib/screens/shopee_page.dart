import 'package:access_trade/controllers/coupons_shopee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopeePage extends GetView<CouponsShopeeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Shopee Coupons'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
            icon:
                Get.isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
