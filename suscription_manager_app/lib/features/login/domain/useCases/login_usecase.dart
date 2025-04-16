import 'package:suscription_manager_app/core/domain/models/user.dart';
import 'package:suscription_manager_app/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  LoginUseCase(this.loginRepository);

  final LoginRepository loginRepository;

  Stream<User> login(String email, String password) async* {
    yield* loginRepository.login(email, password);
  }
}
