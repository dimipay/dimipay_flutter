import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PaymentMethod {
  String systemId;
  DateTime createdAt;
  DateTime updatedAt;
  String? color;
  String? name;
  int ownerId;
  PaymentMethod({
    required this.systemId,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.name,
    required this.ownerId,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
