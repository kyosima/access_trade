import 'package:access_trade/models/coupons.dart';
import 'package:access_trade/services/api_service.dart';
import 'package:get/get.dart';

class CouponsShopeeController extends GetxController {
  var getCouponsShopee = CouponsModel().data.obs;
  ApiServiceShopee service = ApiServiceShopee();
  var couponsShopeeLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCouponsShopeeMethod();
    super.onInit();
  }

  getCouponsShopeeMethod() async {
    try {
      couponsShopeeLoading.value = true;
      var result = await service.fetchCouponShopee();
      if (result != null) {
        getCouponsShopee.value = result.data;
        print(getCouponsShopee.value![0].name);
      } else {
        print("null");
      }
    } finally {
      couponsShopeeLoading.value = false;
    }
    update();
  }
}
