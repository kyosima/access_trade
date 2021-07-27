import 'dart:convert';

CouponsModel couponsFromJson(String str) =>
    CouponsModel.fromJson(json.decode(str));

String couponsToJson(CouponsModel data) => json.encode(data.toJson());

class CouponsModel {
  CouponsModel({
    this.data,
  });

  List<Datum>? data;

  factory CouponsModel.fromJson(Map<String, dynamic> json) => CouponsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.affLink,
    required this.banners,
    required this.categories,
    this.content,
    required this.coupons,
    required this.domain,
    required this.endTime,
    required this.id,
    required this.image,
    required this.link,
    required this.merchant,
    required this.name,
    required this.startTime,
  });

  String affLink;
  List<dynamic> banners;
  List<Category> categories;
  String? content;
  List<Coupon> coupons;
  String domain;
  DateTime endTime;
  String id;
  String image;
  String link;
  String merchant;
  String name;
  DateTime startTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        affLink: json["aff_link"],
        banners: List<dynamic>.from(json["banners"].map((x) => x)),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        content: json["content"] == null ? null : json["content"],
        coupons:
            List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
        domain: json["domain"],
        endTime: DateTime.parse(json["end_time"]),
        id: json["id"],
        image: json["image"],
        link: json["link"],
        merchant: json["merchant"],
        name: json["name"],
        startTime: DateTime.parse(json["start_time"]),
      );

  Map<String, dynamic> toJson() => {
        "aff_link": affLink,
        "banners": List<dynamic>.from(banners.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "content": content == null ? null : content,
        "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
        "domain": domain,
        "end_time":
            "${endTime.year.toString().padLeft(4, '0')}-${endTime.month.toString().padLeft(2, '0')}-${endTime.day.toString().padLeft(2, '0')}",
        "id": id,
        "image": image,
        "link": link,
        "merchant": merchant,
        "name": name,
        "start_time":
            "${startTime.year.toString().padLeft(4, '0')}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')}",
      };
}

class Category {
  Category({
    required this.categoryName,
    required this.categoryNameShow,
    required this.categoryNo,
  });

  String categoryName;
  String categoryNameShow;
  String categoryNo;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        categoryNameShow: json["category_name_show"],
        categoryNo: json["category_no"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_name_show": categoryNameShow,
        "category_no": categoryNo,
      };
}

class Coupon {
  Coupon({
    this.couponCode,
    required this.couponDesc,
    required this.couponSave,
  });

  String? couponCode;
  String couponDesc;
  String couponSave;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        couponCode: json["coupon_code"],
        couponDesc: json["coupon_desc"],
        couponSave: json["coupon_save"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_code": couponCode,
        "coupon_desc": couponDesc,
        "coupon_save": couponSave,
      };
}
