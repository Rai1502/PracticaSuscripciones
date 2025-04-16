import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/core/data/datapools/user_data_pool.dart';
import 'package:suscription_manager_app/features/login/domain/useCases/login_usecase.dart';
import 'package:suscription_manager_app/features/login/presentation/providers/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.loginUsecase}) : super(const LoginState());

  final LoginUseCase loginUsecase;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void login({Function()? onSuccess}) {
    state = state.copyWith(isLoading: true, error: null);
    loginUsecase.login(state.email, state.password).listen((user) {
      // Guardamos el usuario en el DataPool
      userDataPool.addUser(user);
      state = state.copyWith(isLoading: false, error: null);

      onSuccess?.call();
    }, onError: (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    });
  }
}
