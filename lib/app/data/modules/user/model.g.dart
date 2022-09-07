// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      systemId: json['systemId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDisabled: json['isDisabled'] as bool?,
      accountName: json['accountName'] as String,
      name: json['name'] as String,
      isTeacher: json['isTeacher'] as bool?,
      profileImage: json['profileImage'] as String?,
      studentNumber: json['studentNumber'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'accountName': instance.accountName,
      'name': instance.name,
      'systemId': instance.systemId,
      'isDisabled': instance.isDisabled,
      'isTeacher': instance.isTeacher,
      'profileImage': instance.profileImage,
      'studentNumber': instance.studentNumber,
    };
