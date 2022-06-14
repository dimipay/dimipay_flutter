// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

enum PaymentType {
  PREPAID,
  GENERAL,
  COUPON,
}

@JsonSerializable()
class PaymentMethod {
  String systemId;
  DateTime createdAt;
  DateTime updatedAt;
  PaymentType type;
  String color;
  String name;
  int ownerId;
  PaymentMethod({required this.systemId, required this.createdAt, required this.updatedAt, required this.type, required this.color, required this.name, required this.ownerId});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
