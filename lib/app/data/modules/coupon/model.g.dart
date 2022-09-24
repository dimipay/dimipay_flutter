// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issuer _$IssuerFromJson(Map<String, dynamic> json) => Issuer(
      name: json['name'] as String,
      isTeacher: json['isTeacher'] as bool,
      systemId: json['systemId'] as String,
    );

Map<String, dynamic> _$IssuerToJson(Issuer instance) => <String, dynamic>{
      'name': instance.name,
      'isTeacher': instance.isTeacher,
      'systemId': instance.systemId,
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String,
      expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
      amount: json['amount'] as int,
      issuer: Issuer.fromJson(json['issuer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'amount': instance.amount,
      'issuer': instance.issuer,
    };
