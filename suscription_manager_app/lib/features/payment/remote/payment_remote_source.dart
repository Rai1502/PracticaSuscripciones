import 'package:suscription_manager_app/core/api/api_service.dart';
import 'package:suscription_manager_app/core/constants/api_constants.dart';
import 'package:suscription_manager_app/features/payment/data/models/payment_dto.dart';
import 'package:suscription_manager_app/features/payment/data/sources/payment_source.dart';

class PaymentRemoteSource implements PaymentSource {
  final ApiService _apiService;

  PaymentRemoteSource(this._apiService);

  @override
  Stream<PaymentDto> addPayment(String type, String holderName,
      String expiryDate, String cardNumber) async* {
    yield* _apiService
        .post(
          ApiConstants.payments,
          {
            'type': 'credit_card',
            'holder_name': holderName,
            'expiry_date': expiryDate,
            'card_number': cardNumber
          },
        )
        .asStream()
        .map((response) => PaymentDto.fromJson(response.data));
  }

  @override
  Stream<bool> deletePaymentMethod(String paymentId) {
    // TODO: implement deletePaymentMethod
    throw UnimplementedError();
  }

  @override
  Stream<List<PaymentDto>> getPayments() async* {
    yield* _apiService
        .get(ApiConstants.payments)
        .asStream()
        .map((response) => PaymentsDto.fromJson(response.data))
        .map(((PaymentsDto paymentsDto) => paymentsDto.payments ?? []));
  }

  @override
  Stream<bool> setPrimaryPaymentMethod(String paymentId) async* {
    yield* _apiService
        .put('${ApiConstants.payments}/$paymentId/primary', {})
        .asStream()
        .map((response) => response.statusCode == 200);
  }
}
