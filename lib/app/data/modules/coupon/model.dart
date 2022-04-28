import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Issuer {
  String name;
  bool isTeacher;
  String systemId;

  Issuer({required this.name, required this.isTeacher, required this.systemId});
  factory Issuer.fromJson(Map<String, dynamic> json) => _$IssuerFromJson(json);
  Map<String, dynamic> toJson() => _$IssuerToJson(this);
}

@JsonSerializable()
class Coupon {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  DateTime? expiresAt;
  int amount;

  Issuer issuer;

  Coupon({required this.id, required this.createdAt, required this.updatedAt, required this.name, this.expiresAt, required this.amount, required this.issuer});
  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
  Map<String, dynamic> toJson() => _$CouponToJson(this);
}
