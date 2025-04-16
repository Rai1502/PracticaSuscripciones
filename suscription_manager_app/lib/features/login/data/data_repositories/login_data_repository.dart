import 'package:suscription_manager_app/core/data/models/user_dto.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';
import 'package:suscription_manager_app/features/login/data/sources/login_source.dart';
import 'package:suscription_manager_app/features/login/domain/repositories/login_repository.dart';

class LoginDataRepository implements LoginRepository {
  final LoginSource? loginSource;

  LoginDataRepository({this.loginSource});

  @override
  Stream<User> login(String email, String password) async* {
    yield* loginSource!.login(email, password).map(_mapUserFromDto);
  }

  User _mapUserFromDto(UserDto user) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        token: user.token,
        subscriptionStatus: _mapSubscriptionStatus(user.subscriptionStatus),
        nextPaymentDate: DateTime.parse(user.nextPaymentDate),
        nextPaymentAmount: user.nextPaymentAmount,
      );

  SubscriptionStatus _mapSubscriptionStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return SubscriptionStatus.active;
      case 'cancelled':
        return SubscriptionStatus.cancelled;
      case 'trial':
        return SubscriptionStatus.trial;
      default:
        throw Exception('Invalid subscription status: $status');
    }
  }
}
