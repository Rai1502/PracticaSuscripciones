import 'package:suscription_manager_app/features/payment/data/models/payment_dto.dart';

abstract class PaymentSource {
  Stream<List<PaymentDto>> getPayments();
  Stream<PaymentDto> addPayment(
      String type, String holderName, String expiryDate, String cardNumber);
  Stream<bool> setPrimaryPaymentMethod(String paymentId);
  Stream<bool> deletePaymentMethod(String paymentId);
}
