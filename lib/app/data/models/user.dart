import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
