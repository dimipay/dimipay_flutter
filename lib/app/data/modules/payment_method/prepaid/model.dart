import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PrepaidCard extends PaymentMethod {
  int balance;

  PrepaidCard({
    required super.systemId,
    required super.createdAt,
    required super.updatedAt,
    required super.color,
    required super.name,
    required super.ownerId,
    required this.balance,
  });

  factory PrepaidCard.fromJson(Map<String, dynamic> json) => _$PrepaidCardFromJson(json);
  // ignore: annotate_overrides
  Map<String, dynamic> toJson() => _$PrepaidCardToJson(this);
}
