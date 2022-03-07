import 'package:json_annotation/json_annotation.dart';
part 'notice.g.dart';

@JsonSerializable()
class Notice {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime startsAt;
  DateTime? endsAt;

  String title;
  String description;
  String url;
  String authorId;

  Notice({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startsAt,
    this.endsAt,
    required this.title,
    required this.description,
    required this.url,
    required this.authorId,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
