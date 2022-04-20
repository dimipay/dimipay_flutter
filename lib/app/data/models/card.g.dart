// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DPCard _$DPCardFromJson(Map<String, dynamic> json) => DPCard(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updateAt: DateTime.parse(json['updateAt'] as String),
      type: json['type'] as String,
      color: json['color'] as String,
      name: json['name'] as String,
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$DPCardToJson(DPCard instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updateAt': instance.updateAt.toIso8601String(),
      'type': instance.type,
      'color': instance.color,
      'name': instance.name,
      'ownerId': instance.ownerId,
    };
