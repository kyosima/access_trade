import 'package:access_trade/models/coupons.dart';
import 'package:access_trade/services/api_service.dart';
import 'package:get/get.dart';

class CouponsTikiController extends GetxController {
  var getCouponsTiki = CouponsModel().data.obs;
  ApiServiceTiki service = ApiServiceTiki();
  var couponsTikiLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCouponsTikiMethod();
    super.onInit();
  }

  getCouponsTikiMethod() async {
    try {
      couponsTikiLoading.value = true;
      var result = await service.fetchCouponTiki();
      if (result != null) {
        getCouponsTiki.value = result.data;
        print(getCouponsTiki.value![0].name);
      } else {
        print("null");
      }
    } finally {
      couponsTikiLoading.value = false;
    }
    update();
  }
}
