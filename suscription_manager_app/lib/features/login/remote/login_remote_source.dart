import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:suscription_manager_app/core/constants/api_constants.dart';
import 'package:suscription_manager_app/core/data/models/user_dto.dart';
import 'package:suscription_manager_app/features/login/data/sources/login_source.dart';

class LoginRemoteSource implements LoginSource {
  @override
  Stream<UserDto> login(String email, String password) async* {
    // Simular delay de red
    await Future.delayed(ApiConstants.simulatedDelay);

    // Simular validación
    if (email == ApiConstants.validEmail &&
        password == ApiConstants.validPassword) {
      try {
        // Leer el JSON
        final jsonString =
            await rootBundle.loadString('assets/mocks/user.json');
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

        // Convertir a DTO
        yield UserDto.fromJson(jsonMap);
      } catch (e) {
        throw Exception('Error loading user data: $e');
      }
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
