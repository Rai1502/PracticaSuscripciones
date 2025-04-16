import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suscription_manager_app/features/payment/domain/models/payment.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(false) bool isLoading,
    @Default([]) List<Payment> payments,
    String? error,

    // Campos del formulario
    @Default('')
    String type, //no se usa, eliminemoslo una vez que quede el formulario
    @Default('') String cardNumber,
    @Default('') String holderName,
    @Default('') String expiryDate,
    @Default('') String cvv,
    @Default('') String cardType,
  }) = _PaymentState;
}
