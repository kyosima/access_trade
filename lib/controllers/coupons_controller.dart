import 'package:access_trade/models/coupons.dart';
import 'package:access_trade/services/api_service.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  var getCoupons = CouponsModel().data.obs;
  ApiService service = ApiService();
  var couponsLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCouponsMethod();
    super.onInit();
  }

  getCouponsMethod() async {
    try {
      couponsLoading.value = true;
      var result = await service.fetchCoupon();
      if (result != null) {
        getCoupons.value = result.data;
        print(getCoupons.value![0].name);
      } else {
        print("null");
      }
    } finally {
      couponsLoading.value = false;
    }
    update();
  }
}
