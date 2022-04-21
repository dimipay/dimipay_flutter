import 'package:json_annotation/json_annotation.dart';
part 'payment_method.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

enum PaymentType {
  PREPAID,
  GENERAL,
}

@JsonSerializable()
class PaymentMethod {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  PaymentType type;
  String? color;
  String? name;
  String ownerId;
  PaymentMethod({required this.id, required this.createdAt, required this.updatedAt, required this.type, required this.color, required this.name, required this.ownerId});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
