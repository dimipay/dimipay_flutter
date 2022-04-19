import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Event {
  String title;
  String describtion;
  String url;
  DateTime? startsAt;
  DateTime? endsAt;

  Event({
    required this.title,
    required this.describtion,
    required this.url,
    this.startsAt,
    this.endsAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
