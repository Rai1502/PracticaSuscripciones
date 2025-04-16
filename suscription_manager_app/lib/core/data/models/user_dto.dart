import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.subscriptionStatus,
    required this.nextPaymentDate,
    required this.nextPaymentAmount,
  });

  final String id;
  final String name;
  final String email;
  final String token;
  @JsonKey(name: 'subscription_status')
  final String subscriptionStatus;
  @JsonKey(name: 'next_payment_date')
  final String nextPaymentDate;
  @JsonKey(name: 'next_payment_amount')
  final double nextPaymentAmount;

  // Generados por json_serializable
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
