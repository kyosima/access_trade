import 'package:access_trade/controllers/coupons_controller.dart';
import 'package:access_trade/controllers/coupons_lazada_controller.dart';
import 'package:access_trade/controllers/coupons_shopee_controller.dart';
import 'package:access_trade/controllers/coupons_tiki_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final CouponsController couponsController = Get.put(CouponsController());
  final CouponsTikiController couponsTikiController =
      Get.put(CouponsTikiController());
  final CouponsShopeeController couponsShopeeController =
      Get.put(CouponsShopeeController());
  final CouponsLazadaController couponsLazadaController =
      Get.put(CouponsLazadaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('New Coupons'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              couponsLazadaController.getCouponsLazadaMethod();
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
            icon:
                Get.isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Obx(() {
        if (couponsController.couponsLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              color: Get.isDarkMode ? Colors.black : Colors.white38,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/couponshopee.png',
                                height: 120,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/coupontiki.jpeg',
                                height: 120,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/couponlazada.jpeg',
                                height: 120,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mã khuyến mãi mới nhất",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          TextButton(onPressed: () {}, child: Text('Xem thêm'))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //NEW COUPONS
                      Column(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Get.isDarkMode
                                      ? Colors.white12
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 9,
                                      offset: Offset(1, 2), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        couponsController
                                            .getCoupons.value![index].image,
                                        height: 80,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text(
                                              couponsController.getCoupons
                                                  .value![index].name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    couponsController
                                                            .getCoupons
                                                            .value![index]
                                                            .coupons
                                                            .isEmpty
                                                        ? Text('Loading...')
                                                        : Text(
                                                            '${couponsController.getCoupons.value![index].coupons[0].couponCode}',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Ngày hết hạn : ${couponsController.getCoupons.value![index].endTime.toString().split(" ")[0]}",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.blue),
                                                  ),
                                                  onPressed: () {
                                                    Get.bottomSheet(
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        height: 600,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.network(
                                                                couponsController
                                                                    .getCoupons
                                                                    .value![
                                                                        index]
                                                                    .image,
                                                                height: 150,
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                couponsController
                                                                    .getCoupons
                                                                    .value![
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              couponsController
                                                                      .getCoupons
                                                                      .value![
                                                                          index]
                                                                      .coupons
                                                                      .isEmpty
                                                                  ? Text(
                                                                      'Code đang được cập nhật...')
                                                                  : Text(
                                                                      '${couponsController.getCoupons.value![index].coupons[0].couponCode}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                    ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                'Danh mục : ${couponsController.getCoupons.value![index].categories[0].categoryNameShow}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    " ${couponsController.getCoupons.value![index].startTime.toString().split(" ")[0]}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons.bolt,
                                                                    size: 50,
                                                                    color: Colors
                                                                        .yellow,
                                                                  ),
                                                                  Text(
                                                                    " ${couponsController.getCoupons.value![index].endTime.toString().split(" ")[0]}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "${couponsController.getCoupons.value![index].content}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ElevatedButton
                                                                  .icon(
                                                                      onPressed:
                                                                          () async {
                                                                        print(couponsController
                                                                            .getCoupons
                                                                            .value![index]
                                                                            .link);
                                                                        var url =
                                                                            '${couponsController.getCoupons.value![index].link}';
                                                                        if (await canLaunch(
                                                                            url)) {
                                                                          await launch(
                                                                              url);
                                                                          print(
                                                                              url);
                                                                        } else {
                                                                          throw "Can not load url";
                                                                        }
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .whatshot),
                                                                      label: Text(
                                                                          'Áp dụng'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    "Chi tiết",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:
                              Image.asset('assets/images/shopee_banner.png')),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã khuyến mãi Shopee',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Xem thêm'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Shoppee
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              couponsShopeeController
                                  .getCouponsShopee.value!.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Get.isDarkMode
                                        ? Colors.white12
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 9,
                                        offset: Offset(3, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              couponsShopeeController
                                                  .getCouponsShopee
                                                  .value![index]
                                                  .image,
                                              height: 140,
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "${couponsShopeeController.getCouponsShopee.value![index].endTime.toString().split(" ")[0]}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponsShopeeController
                                              .getCouponsShopee
                                              .value![index]
                                              .name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        couponsShopeeController.getCouponsShopee
                                                .value![index].coupons.isEmpty
                                            ? Text('Loading...')
                                            : Text(
                                                '${couponsShopeeController.getCouponsShopee.value![index].coupons[0].couponCode}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.deepOrange),
                                          ),
                                          onPressed: () {
                                            Get.bottomSheet(
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: 600,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.network(
                                                        couponsShopeeController
                                                            .getCouponsShopee
                                                            .value![index]
                                                            .image,
                                                        height: 150,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        couponsShopeeController
                                                            .getCouponsShopee
                                                            .value![index]
                                                            .name,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      couponsShopeeController
                                                              .getCouponsShopee
                                                              .value![index]
                                                              .coupons
                                                              .isEmpty
                                                          ? Text(
                                                              'Code đang được cập nhật...')
                                                          : Text(
                                                              '${couponsShopeeController.getCouponsShopee.value![index].coupons[0].couponCode}',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Danh mục : ${couponsShopeeController.getCouponsShopee.value![index].categories[0].categoryNameShow}',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            " ${couponsShopeeController.getCouponsShopee.value![index].startTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.bolt,
                                                            size: 50,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Text(
                                                            " ${couponsShopeeController.getCouponsShopee.value![index].endTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "${couponsShopeeController.getCouponsShopee.value![index].content}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ElevatedButton.icon(
                                                          onPressed: () async {
                                                            var url =
                                                                '${couponsShopeeController.getCouponsShopee.value![index].link}';
                                                            if (await canLaunch(
                                                                url)) {
                                                              await launch(url);
                                                              print(url);
                                                            } else {
                                                              throw "Can not load url";
                                                            }
                                                          },
                                                          icon: Icon(
                                                              Icons.whatshot),
                                                          label:
                                                              Text('Áp dụng'))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Chi tiết",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:
                              Image.asset('assets/images/tiki_khuyenmai.jpeg')),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã khuyến mãi Tiki',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Xem thêm'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Tiki
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              couponsTikiController
                                  .getCouponsTiki.value!.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Get.isDarkMode
                                        ? Colors.white12
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 9,
                                        offset: Offset(3, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              couponsTikiController
                                                  .getCouponsTiki
                                                  .value![index]
                                                  .image,
                                              height: 140,
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "${couponsTikiController.getCouponsTiki.value![index].endTime.toString().split(" ")[0]}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponsTikiController.getCouponsTiki
                                              .value![index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        couponsTikiController.getCouponsTiki
                                                .value![index].coupons.isEmpty
                                            ? Text('Loading...')
                                            : Text(
                                                '${couponsTikiController.getCouponsTiki.value![index].coupons[0].couponCode}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blueAccent),
                                          ),
                                          onPressed: () {
                                            Get.bottomSheet(
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: 800,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.network(
                                                        couponsTikiController
                                                            .getCouponsTiki
                                                            .value![index]
                                                            .image,
                                                        height: 200,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        couponsTikiController
                                                            .getCouponsTiki
                                                            .value![index]
                                                            .name,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      couponsTikiController
                                                              .getCouponsTiki
                                                              .value![index]
                                                              .coupons
                                                              .isEmpty
                                                          ? Text(
                                                              'Code đang được cập nhật...')
                                                          : Text(
                                                              '${couponsTikiController.getCouponsTiki.value![index].coupons[0].couponCode}',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Danh mục : ${couponsTikiController.getCouponsTiki.value![index].categories[0].categoryNameShow}',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            " ${couponsTikiController.getCouponsTiki.value![index].startTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.bolt,
                                                            size: 50,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Text(
                                                            " ${couponsTikiController.getCouponsTiki.value![index].endTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ElevatedButton.icon(
                                                          onPressed: () async {
                                                            var url =
                                                                '${couponsTikiController.getCouponsTiki.value![index].link}';
                                                            if (await canLaunch(
                                                                url)) {
                                                              await launch(url);
                                                            } else {
                                                              throw "Can not load url";
                                                            }
                                                          },
                                                          icon: Icon(
                                                              Icons.whatshot),
                                                          label:
                                                              Text('Áp dụng'))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Chi tiết",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('assets/images/lazada.jpeg')),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã khuyến mãi Lazada',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Xem thêm'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Tiki
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              couponsLazadaController
                                  .getCouponsLazada.value!.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Get.isDarkMode
                                        ? Colors.white12
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 9,
                                        offset: Offset(3, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              couponsLazadaController
                                                  .getCouponsLazada
                                                  .value![index]
                                                  .image,
                                              height: 140,
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.pinkAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "${couponsLazadaController.getCouponsLazada.value![index].endTime.toString().split(" ")[0]}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          couponsLazadaController
                                              .getCouponsLazada
                                              .value![index]
                                              .name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        couponsLazadaController
                                                .getCouponsLazada
                                                .value![index]
                                                .categories
                                                .isEmpty
                                            ? Text(" ")
                                            : Text(couponsLazadaController
                                                .getCouponsLazada
                                                .value![index]
                                                .categories[0]
                                                .categoryNameShow),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blueAccent),
                                          ),
                                          onPressed: () {
                                            Get.bottomSheet(
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: 800,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.network(
                                                        couponsLazadaController
                                                            .getCouponsLazada
                                                            .value![index]
                                                            .image,
                                                        height: 200,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        couponsLazadaController
                                                            .getCouponsLazada
                                                            .value![index]
                                                            .name,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      couponsLazadaController
                                                              .getCouponsLazada
                                                              .value![index]
                                                              .coupons
                                                              .isEmpty
                                                          ? Text(
                                                              'Code đang được cập nhật...')
                                                          : Text(
                                                              '${couponsLazadaController.getCouponsLazada.value![index].coupons[0].couponCode}',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Danh mục : ${couponsLazadaController.getCouponsLazada.value![index].categories[0].categoryNameShow}',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            " ${couponsLazadaController.getCouponsLazada.value![index].startTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.bolt,
                                                            size: 50,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          Text(
                                                            " ${couponsLazadaController.getCouponsLazada.value![index].endTime.toString().split(" ")[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ElevatedButton.icon(
                                                          onPressed: () async {
                                                            var url =
                                                                '${couponsLazadaController.getCouponsLazada.value![index].link}';
                                                            if (await canLaunch(
                                                                url)) {
                                                              await launch(url);
                                                            } else {
                                                              throw "Can not load url";
                                                            }
                                                          },
                                                          icon: Icon(
                                                              Icons.whatshot),
                                                          label:
                                                              Text('Áp dụng'))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Chi tiết",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
