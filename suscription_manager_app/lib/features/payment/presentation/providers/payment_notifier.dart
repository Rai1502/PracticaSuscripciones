import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/features/payment/domain/useCases/payment_useCases.dart';
import 'package:suscription_manager_app/features/payment/presentation/providers/payment_state.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  final PaymentUseCases paymentUseCases;

  PaymentNotifier({required this.paymentUseCases}) : super(PaymentState());

  void getPayments() {
    state = state.copyWith(isLoading: true);
    paymentUseCases.getPayments().listen((payments) {
      state = state.copyWith(payments: payments, isLoading: false);
    }, onError: (error) {
      state = state.copyWith(error: error.toString(), isLoading: false);
    });
  }

  void setCardNumber(String cardNumber) {
    state = state.copyWith(cardNumber: cardNumber);
  }

  void setHolderName(String holderName) {
    state = state.copyWith(holderName: holderName);
  }

  void setExpiryDate(String expiryDate) {
    state = state.copyWith(expiryDate: expiryDate);
  }

  void setCardType(String cardType) {
    state = state.copyWith(cardType: cardType);
  }

  void addPayment({Function()? onSuccess}) {
    state = state.copyWith(isLoading: true);
    paymentUseCases
        .addPayment(
      type: state.cardType,
      holderName: state.holderName,
      expiryDate: state.expiryDate,
      cardNumber: state.cardNumber,
    )
        .listen((payment) {
      final updatedPayments = [...state.payments, payment];
      state = state.copyWith(
        payments: updatedPayments,
        isLoading: false,
        // Limpiamos los campos del formulario
        cardNumber: '',
        holderName: '',
        expiryDate: '',
      );
      onSuccess?.call();
    }, onError: (error) {
      state = state.copyWith(error: error.toString(), isLoading: false);
    });
  }

  void setPrimaryPayment(String paymentId) {
    state = state.copyWith(isLoading: true);
    paymentUseCases.setPrimaryPayment(paymentId).listen((success) {
      if (success) {
        final updatedPayments = state.payments.map((p) {
          if (p.id == paymentId) {
            return p.copyWith(isPrimary: true);
          } else {
            return p.copyWith(isPrimary: false);
          }
        }).toList();
        state = state.copyWith(
          payments: updatedPayments,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'No se pudo actualizar la tarjeta principal',
        );
      }
    });
  }
}
