//Provider para repositorio de login
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/features/login/data/data_repositories/login_data_repository.dart';
import 'package:suscription_manager_app/features/login/domain/repositories/login_repository.dart';
import 'package:suscription_manager_app/features/login/domain/useCases/login_usecase.dart';
import 'package:suscription_manager_app/features/login/presentation/providers/login_notifier.dart';
import 'package:suscription_manager_app/features/login/presentation/providers/login_state.dart';
import 'package:suscription_manager_app/features/login/remote/login_remote_source.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginDataRepository(loginSource: LoginRemoteSource());
});

// Provider para el UseCase
final loginUsecaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(loginRepositoryProvider);
  return LoginUseCase(repository);
});

// Provider para el Notifier (estado)
final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final usecase = ref.watch(loginUsecaseProvider);
  return LoginNotifier(loginUsecase: usecase);
});

// Provider para acceder al controlador
final loginControllerProvider = Provider<LoginNotifier>((ref) {
  return ref.watch(loginNotifierProvider.notifier);
});
