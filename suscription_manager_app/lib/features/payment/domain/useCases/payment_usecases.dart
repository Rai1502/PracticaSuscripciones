import 'package:suscription_manager_app/features/payment/domain/models/payment.dart';
import 'package:suscription_manager_app/features/payment/domain/repositories/payment_repository.dart';

class PaymentUseCases {
  final PaymentRepository paymentRepository;

  PaymentUseCases(this.paymentRepository);

  Stream<List<Payment>> getPayments() async* {
    yield* paymentRepository.getPayments();
  }

  Stream<Payment> addPayment({
    required String type,
    required String holderName,
    required String expiryDate,
    required String cardNumber,
  }) async* {
    yield* paymentRepository.addPayment(
        type, holderName, expiryDate, cardNumber);
  }

  Stream<bool> setPrimaryPayment(String paymentId) async* {
    yield* paymentRepository.setPrimaryPaymentMethod(paymentId);
  }

  Stream<bool> deletePayment(String paymentId) async* {
    yield* paymentRepository.deletePaymentMethod(paymentId);
  }
}
