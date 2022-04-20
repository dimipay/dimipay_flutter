import 'package:json_annotation/json_annotation.dart';
part 'card.g.dart';

@JsonSerializable()
class DPCard {
  String id;
  DateTime createdAt;
  DateTime updateAt;
  String type;
  String color;
  String name;
  String ownerId;
  DPCard({required this.id, required this.createdAt, required this.updateAt, required this.type, required this.color, required this.name, required this.ownerId});

  factory DPCard.fromJson(Map<String, dynamic> json) => _$DPCardFromJson(json);
  Map<String, dynamic> toJson() => _$DPCardToJson(this);
}
