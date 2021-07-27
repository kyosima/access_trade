import 'package:access_trade/models/coupons.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<CouponsModel> fetchCoupon() async {
    final response = await http.get(
        Uri.parse('https://api.accesstrade.vn/v1/offers_informations'),
        headers: {"Authorization": "Token 2hH37s83-wHsH-QaMR5a5pu_IPa7Jk2z"});
    if (response.statusCode == 200) {
      return couponsFromJson(response.body);
    } else {
      throw Exception('Failed to load Coupons');
    }
  }
}

class ApiServiceShopee {
  Future<CouponsModel> fetchCouponShopee() async {
    final response = await http.get(
        Uri.parse(
            'https://api.accesstrade.vn/v1/offers_informations?domain=shopee.vn'),
        headers: {"Authorization": "Token 2hH37s83-wHsH-QaMR5a5pu_IPa7Jk2z"});
    if (response.statusCode == 200) {
      return couponsFromJson(response.body);
    } else {
      throw Exception('Failed to load Coupons');
    }
  }
}

class ApiServiceTiki {
  Future<CouponsModel> fetchCouponTiki() async {
    final response = await http.get(
        Uri.parse(
            'https://api.accesstrade.vn/v1/offers_informations?domain=tiki.vn'),
        headers: {"Authorization": "Token 2hH37s83-wHsH-QaMR5a5pu_IPa7Jk2z"});
    if (response.statusCode == 200) {
      return couponsFromJson(response.body);
    } else {
      throw Exception('Failed to load Coupons');
    }
  }
}

class ApiServiceLazada {
  Future<CouponsModel> fetchCouponTiki() async {
    final response = await http.get(
        Uri.parse(
            'https://api.accesstrade.vn/v1/offers_informations?domain=lazada.vn'),
        headers: {"Authorization": "Token 2hH37s83-wHsH-QaMR5a5pu_IPa7Jk2z"});
    if (response.statusCode == 200) {
      return couponsFromJson(response.body);
    } else {
      throw Exception('Failed to load Coupons');
    }
  }
}
