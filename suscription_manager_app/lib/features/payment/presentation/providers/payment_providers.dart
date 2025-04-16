import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/core/api/api_service.dart';
import 'package:suscription_manager_app/features/payment/data/data_repositories/payment_data_repository.dart';
import 'package:suscription_manager_app/features/payment/domain/repositories/payment_repository.dart';
import 'package:suscription_manager_app/features/payment/domain/useCases/payment_useCases.dart';
import 'package:suscription_manager_app/features/payment/presentation/providers/payment_notifier.dart';
import 'package:suscription_manager_app/features/payment/presentation/providers/payment_state.dart';
import 'package:suscription_manager_app/features/payment/remote/payment_remote_source.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentDataRepository(
      paymentSource: PaymentRemoteSource(ApiService()));
});

final paymentUseCasesProvider = Provider<PaymentUseCases>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return PaymentUseCases(repository);
});

final paymentNotifierProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  final useCases = ref.watch(paymentUseCasesProvider);
  return PaymentNotifier(paymentUseCases: useCases);
});

final paymentControllerProvider = Provider<PaymentNotifier>((ref) {
  return ref.watch(paymentNotifierProvider.notifier);
});
