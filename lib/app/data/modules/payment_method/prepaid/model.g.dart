// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrepaidCard _$PrepaidCardFromJson(Map<String, dynamic> json) => PrepaidCard(
      systemId: json['systemId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      color: json['color'] as String?,
      name: json['name'] as String?,
      ownerId: json['ownerId'] as int,
      balance: json['balance'] as int,
    );

Map<String, dynamic> _$PrepaidCardToJson(PrepaidCard instance) =>
    <String, dynamic>{
      'systemId': instance.systemId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'color': instance.color,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'balance': instance.balance,
    };
