// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentDto _$CreatePaymentDtoFromJson(Map<String, dynamic> json) =>
    CreatePaymentDto(
      type: json['type'] as String,
      cardNumber: json['cardNumber'] as String,
      holderName: json['holderName'] as String,
      expiryDate: json['expiryDate'] as String,
      cvv: json['cvv'] as String,
    );

Map<String, dynamic> _$CreatePaymentDtoToJson(CreatePaymentDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'cardNumber': instance.cardNumber,
      'holderName': instance.holderName,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
    };

PaymentsDto _$PaymentsDtoFromJson(Map<String, dynamic> json) => PaymentsDto(
      payments: (json['payment_methods'] as List<dynamic>?)
          ?.map((e) => PaymentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentsDtoToJson(PaymentsDto instance) =>
    <String, dynamic>{
      'payment_methods': instance.payments,
    };

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) => PaymentDto(
      id: json['id'] as String,
      type: json['type'] as String,
      lastFour: json['last_four'] as String,
      holderName: json['holder_name'] as String,
      expiryDate: json['expiry_date'] as String,
      isPrimary: json['is_primary'] as bool,
      cardType: json['card_type'] as String,
    );

Map<String, dynamic> _$PaymentDtoToJson(PaymentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'last_four': instance.lastFour,
      'holder_name': instance.holderName,
      'expiry_date': instance.expiryDate,
      'is_primary': instance.isPrimary,
      'card_type': instance.cardType,
    };
