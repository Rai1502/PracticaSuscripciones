import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/core/data/datapools/user_data_pool.dart';
import 'package:suscription_manager_app/features/subscription/presentation/providers/subscription_state.dart';

class SubscriptionNotifier extends StateNotifier<SubscriptionState> {
  SubscriptionNotifier() : super(const SubscriptionState()) {
    // Inicializar con el valor actual si existe
    if (userDataPool.user != null) {
      state = state.copyWith(user: userDataPool.user);
    }

    // Escuchar cambios futuros
    userDataPool.stream.listen((user) {
      state = state.copyWith(user: user);
    });
  }
}
