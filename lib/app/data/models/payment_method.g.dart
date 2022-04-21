// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      type: $enumDecode(_$PaymentTypeEnumMap, json['type']),
      color: json['color'] as String?,
      name: json['name'] as String?,
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'type': _$PaymentTypeEnumMap[instance.type],
      'color': instance.color,
      'name': instance.name,
      'ownerId': instance.ownerId,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.PREPAID: 'PREPAID',
  PaymentType.GENERAL: 'GENERAL',
};
