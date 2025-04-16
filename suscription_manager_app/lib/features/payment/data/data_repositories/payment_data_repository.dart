import 'package:suscription_manager_app/features/payment/data/models/payment_dto.dart';
import 'package:suscription_manager_app/features/payment/data/sources/payment_source.dart';
import 'package:suscription_manager_app/features/payment/domain/models/payment.dart';
import 'package:suscription_manager_app/features/payment/domain/repositories/payment_repository.dart';

class PaymentDataRepository implements PaymentRepository {
  PaymentDataRepository({required this.paymentSource});

  final PaymentSource paymentSource;

  @override
  Stream<Payment> addPayment(String type, String holderName, String expiryDate,
      String cardNumber) async* {
    yield* paymentSource
        .addPayment(type, holderName, expiryDate, cardNumber)
        .map((paymentDto) => _mapPaymentFromDto(paymentDto));
  }

  @override
  Stream<bool> deletePaymentMethod(String paymentId) {
    // TODO: implement deletePaymentMethod
    throw UnimplementedError();
  }

  @override
  Stream<List<Payment>> getPayments() async* {
    yield* paymentSource.getPayments().map((paymentsDto) => paymentsDto
        .map((paymentDto) => _mapPaymentFromDto(paymentDto))
        .toList());
  }

  @override
  Stream<bool> setPrimaryPaymentMethod(String paymentId) async* {
    yield* paymentSource.setPrimaryPaymentMethod(paymentId);
  }

  Payment _mapPaymentFromDto(PaymentDto payment) => Payment(
        id: payment.id,
        type: payment.type,
        lastFour: payment.lastFour,
        holderName: payment.holderName,
        expiryDate: payment.expiryDate,
        isPrimary: payment.isPrimary,
        cardType: payment.cardType,
      );
}
