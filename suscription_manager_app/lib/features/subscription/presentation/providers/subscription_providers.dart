import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/features/subscription/presentation/providers/subscription_notifier.dart';
import 'package:suscription_manager_app/features/subscription/presentation/providers/subscription_state.dart';

final subscriptionNotifierProvider =
    StateNotifierProvider<SubscriptionNotifier, SubscriptionState>(
        (ref) => SubscriptionNotifier());
