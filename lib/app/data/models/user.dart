class User {
  int? id;
  String? username;
  String? password;
  String? changedPassword;
  double? payMoney;

  String? token;

  User({this.id, this.username, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    payMoney = json['payMoney'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['payMoney'] = payMoney;
    return data;
  }
}
