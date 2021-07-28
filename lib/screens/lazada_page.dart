import 'package:access_trade/controllers/coupons_lazada_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LazadaPage extends GetView<CouponsLazadaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Lazada Coupons'),
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
      body: Obx(() {
        if (controller.couponsLazadaLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: Get.isDarkMode ? Colors.black : Colors.white38,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: controller.getCouponsLazada.value!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.isDarkMode ? Colors.white12 : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 3,
                              offset: Offset(2, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                controller.getCouponsLazada.value![index].image,
                                height: 100,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Center(
                                child: Text(
                                  controller
                                      .getCouponsLazada.value![index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              controller.getCouponsLazada.value![index].coupons
                                      .isEmpty
                                  ? Text('Loading...')
                                  : Text(
                                      '${controller.getCouponsLazada.value![index].coupons[0].couponCode}',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Danh mục : ${controller.getCouponsLazada.value![index].categories[0].categoryNameShow}',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bolt,
                                    size: 30,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    " ${controller.getCouponsLazada.value![index].endTime.toString().split(" ")[0]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              controller.getCouponsLazada.value![index]
                                          .content ==
                                      null
                                  ? Text('')
                                  : Text(
                                      '${controller.getCouponsLazada.value![index].content}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                              SizedBox(
                                height: 7,
                              ),
                              ElevatedButton.icon(
                                  onPressed: () async {
                                    var url =
                                        '${controller.getCouponsLazada.value![index].link}';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                      print(url);
                                    } else {
                                      throw "Can not load url";
                                    }
                                  },
                                  icon: Icon(Icons.whatshot),
                                  label: Text('Áp dụng'))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
          ;
        }
      }),
    );
  }
}
