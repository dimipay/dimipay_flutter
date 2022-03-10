import 'package:json_annotation/json_annotation.dart';
part 'notice.g.dart';

@JsonSerializable()
class Notice {
  DateTime createdAt;

  String title;
  String description;

  Notice({
    required this.createdAt,
    required this.title,
    required this.description,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
