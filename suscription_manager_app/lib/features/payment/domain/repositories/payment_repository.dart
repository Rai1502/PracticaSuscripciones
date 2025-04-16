import 'package:suscription_manager_app/features/payment/domain/models/payment.dart';

abstract class PaymentRepository {
  Stream<List<Payment>> getPayments();
  Stream<bool> setPrimaryPaymentMethod(String paymentId);
  Stream<bool> deletePaymentMethod(String paymentId);
  Stream<Payment> addPayment(
    String type,
    String holderName,
    String expiryDate,
    String cardNumber,
  );
}
