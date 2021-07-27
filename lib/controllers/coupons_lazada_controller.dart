import 'package:access_trade/models/coupons.dart';
import 'package:access_trade/services/api_service.dart';
import 'package:get/get.dart';

class CouponsLazadaController extends GetxController {
  var getCouponsLazada = CouponsModel().data.obs;
  ApiServiceLazada service = ApiServiceLazada();
  var couponsLazadaLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCouponsLazadaMethod();
    super.onInit();
  }

  getCouponsLazadaMethod() async {
    try {
      couponsLazadaLoading.value = true;
      var result = await service.fetchCouponTiki();
      if (result != null) {
        getCouponsLazada.value = result.data;
        print(getCouponsLazada.value![0].name);
      } else {
        print("null");
      }
    } finally {
      couponsLazadaLoading.value = false;
    }
    update();
  }
}
