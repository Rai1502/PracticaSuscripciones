import 'package:suscription_manager_app/core/domain/models/user.dart';

abstract class LoginRepository {
  Stream<User> login(String email, String password);
}
