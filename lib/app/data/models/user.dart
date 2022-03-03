import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// g.dart 파일 생성 : flutter pub run build_runner build

@JsonSerializable()
class User {
  String systemId;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDisabled;
  String accountName;
  String name;

  bool? isTeacher;
  String? profileImage;
  String? studentNumber;

  User({
    required this.systemId,
    required this.createdAt,
    required this.updatedAt,
    required this.isDisabled,
    required this.accountName,
    required this.name,
    this.isTeacher,
    this.profileImage,
    this.studentNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
