import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GeneralCard extends PaymentMethod {
  GeneralCard({
    required String systemId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String color,
    required String name,
    required int ownerId,
  }) : super(systemId: systemId, createdAt: createdAt, updatedAt: updatedAt, color: color, name: name, ownerId: ownerId);

  factory GeneralCard.fromJson(Map<String, dynamic> json) => _$GeneralCardFromJson(json);
  // ignore: annotate_overrides
  Map<String, dynamic> toJson() => _$GeneralCardToJson(this);
}
