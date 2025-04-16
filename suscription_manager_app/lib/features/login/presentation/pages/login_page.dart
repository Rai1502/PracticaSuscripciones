import 'package:flutter/material.dart';
import 'package:suscription_manager_app/features/login/presentation/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginBody()),
    );
  }
}
