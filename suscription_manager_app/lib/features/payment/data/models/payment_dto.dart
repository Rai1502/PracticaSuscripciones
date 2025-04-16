import 'package:json_annotation/json_annotation.dart';

part 'payment_dto.g.dart';

@JsonSerializable()
class CreatePaymentDto {
  final String type;
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final String cvv;

  CreatePaymentDto({
    required this.type,
    required this.cardNumber,
    required this.holderName,
    required this.expiryDate,
    required this.cvv,
  });

  factory CreatePaymentDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreatePaymentDtoToJson(this);
}

@JsonSerializable()
class PaymentsDto {
  @JsonKey(name: 'payment_methods')
  final List<PaymentDto>? payments;

  PaymentsDto({this.payments});

  factory PaymentsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentsDtoToJson(this);
}

@JsonSerializable()
class PaymentDto {
  final String id;
  final String type;
  @JsonKey(name: 'last_four')
  final String lastFour;

  @JsonKey(name: 'holder_name')
  final String holderName;

  @JsonKey(name: 'expiry_date')
  final String expiryDate;

  @JsonKey(name: 'is_primary')
  final bool isPrimary;

  @JsonKey(name: 'card_type')
  final String cardType;

  PaymentDto({
    required this.id,
    required this.type,
    required this.lastFour,
    required this.holderName,
    required this.expiryDate,
    required this.isPrimary,
    required this.cardType,
  });

  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDtoToJson(this);
}
