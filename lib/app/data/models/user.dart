class User {
  int? systemId;
  String? name;
  String? studentNumber;
  String? accountName;
  String? profileImage;
  String? password;
  String? changedPassword;

  double? payMoney;

  List<dynamic>? receivedCoupons;
  List<dynamic>? paymentMethods;

  String? token;

  User({this.systemId, this.name, this.password});

  User.fromJson(Map<String, dynamic> json) {
    systemId = json['systemId'];
    accountName = json['accountName'];
    name = json['name'];
    profileImage = json['profileImage'];
    studentNumber = json['studentNumber'];
    receivedCoupons = json['receivedCoupons'];
    paymentMethods = json['paymentMethods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['systemId'] = systemId;
    data['accountName'] = accountName;
    data['name'] = name;
    data['profileImage'] = profileImage;
    data['studentNumber'] = studentNumber;
    data['receivedCoupons'] = receivedCoupons;
    data['paymentMethods'] = paymentMethods;
    return data;
  }
}
