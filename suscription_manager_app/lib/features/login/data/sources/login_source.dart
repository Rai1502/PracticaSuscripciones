import 'package:suscription_manager_app/core/data/models/user_dto.dart';

abstract class LoginSource {
  Stream<UserDto> login(String email, String password);
}
