import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';

part 'subscription_state.freezed.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    User? user,
    @Default(false) bool isLoading,
    String? error,
  }) = _SubscriptionState;
}
