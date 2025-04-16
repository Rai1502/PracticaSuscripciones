import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/core/utils/logger.dart';
import 'package:suscription_manager_app/core/utils/page_transition.dart';
import 'package:suscription_manager_app/core/widgets/main_button.dart';
import 'package:suscription_manager_app/features/login/presentation/providers/login_providers.dart';
import 'package:suscription_manager_app/features/login/presentation/widgets/custom_text_field.dart';
import 'package:suscription_manager_app/features/subscription/presentation/pages/subscription_page.dart';

class LoginBody extends ConsumerWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);
    final loginController = ref.read(loginControllerProvider);

    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pai.png'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Inicio de Sesión',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              label: 'email',
              onChanged: loginController.setEmail,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              label: 'password',
              onChanged: loginController.setPassword,
              isPassword: true,
            ),
            const SizedBox(
              height: 24,
            ),
            MainButton(
                text: 'Login',
                isLoading: loginState.isLoading,
                onPressed: () => loginController.login(onSuccess: () {
                      logger.i('Login exitoso');
                      Navigator.of(context).pushReplacement(
                        FadePageRoute(
                          page: const SubscriptionPage(),
                        ),
                      );
                    })),
            if (loginState.error != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  loginState.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ));
  }
}
