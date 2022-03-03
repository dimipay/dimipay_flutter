class Coupon {
  int? id;
  String? title;
  String? subtitle;
  DateTime? expireDate;

  String? token;

  Coupon({this.id, this.title, this.subtitle, this.expireDate});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    expireDate = json['expireDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['expireData'] = expireDate;
    return data;
  }
}
