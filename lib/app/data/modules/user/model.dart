import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build

@JsonSerializable()
class User {
  DateTime createdAt;
  DateTime updatedAt;
  String accountName;
  String name;
  bool faceSignRegistered;

  String? systemId;
  bool? isDisabled;
  String? profileImage;

  User({
    required this.systemId,
    required this.createdAt,
    required this.updatedAt,
    required this.isDisabled,
    required this.accountName,
    required this.name,
    required this.faceSignRegistered,
    this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
