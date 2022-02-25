// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      systemId: json['systemId'] as int?,
      name: json['name'] as String?,
      password: json['password'] as String?,
    )
      ..studentNumber = json['studentNumber'] as String?
      ..accountName = json['accountName'] as String?
      ..profileImage = json['profileImage'] as String?
      ..changedPassword = json['changedPassword'] as String?
      ..payMoney = (json['payMoney'] as num?)?.toDouble()
      ..receivedCoupons = json['receivedCoupons'] as List<dynamic>?
      ..paymentMethods = json['paymentMethods'] as List<dynamic>?
      ..token = json['token'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'systemId': instance.systemId,
      'name': instance.name,
      'studentNumber': instance.studentNumber,
      'accountName': instance.accountName,
      'profileImage': instance.profileImage,
      'password': instance.password,
      'changedPassword': instance.changedPassword,
      'payMoney': instance.payMoney,
      'receivedCoupons': instance.receivedCoupons,
      'paymentMethods': instance.paymentMethods,
      'token': instance.token,
    };
