// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      subscriptionStatus: json['subscription_status'] as String,
      nextPaymentDate: json['next_payment_date'] as String,
      nextPaymentAmount: (json['next_payment_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'subscription_status': instance.subscriptionStatus,
      'next_payment_date': instance.nextPaymentDate,
      'next_payment_amount': instance.nextPaymentAmount,
    };
