// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
    };
