import 'package:json_annotation/json_annotation.dart';
part 'card.g.dart';

@JsonSerializable()
class CardItem {
  String id;
  DateTime createdAt;
  DateTime updateAt;
  String type;
  String color;
  String name;
  String ownerId;
  CardItem({required this.id, required this.createdAt, required this.updateAt, required this.type, required this.color, required this.name, required this.ownerId});

  factory CardItem.fromJson(Map<String, dynamic> json) => _$CardItemFromJson(json);
  Map<String, dynamic> toJson() => _$CardItemToJson(this);
}
