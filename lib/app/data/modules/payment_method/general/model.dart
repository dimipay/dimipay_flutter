import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GeneralCard extends PaymentMethod {
  GeneralCard({
    required super.systemId,
    required super.createdAt,
    required super.updatedAt,
    required super.color,
    required super.name,
    required super.ownerId,
  });

  factory GeneralCard.fromJson(Map<String, dynamic> json) => _$GeneralCardFromJson(json);
  // ignore: annotate_overrides
  Map<String, dynamic> toJson() => _$GeneralCardToJson(this);
}
