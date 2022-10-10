import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PaymentMethod {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String? color;
  String? name;
  @JsonKey(name: 'last')
  String last4Digit;
  PaymentMethod({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.name,
    required this.last4Digit,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
