import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suscription_manager_app/features/login/presentation/widgets/login_body.dart';
import 'package:suscription_manager_app/core/widgets/main_button.dart';
import 'package:suscription_manager_app/features/login/presentation/widgets/custom_text_field.dart';

void main() {
  group('LoginBody test', () {
    //creamos el widget de prueba
    testWidgets('Debe renderizar todos los elementos correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LoginBody(),
            ),
          ),
        ),
      );

      //se verifica que existan todos los elementos
      expect(find.text('Inicio de Sesión'), findsOneWidget);
      expect(find.byType(CustomTextField), findsNWidgets(2));
      expect(find.byType(Image), findsOneWidget); // Logo 'pai'
      expect(find.byType(MainButton), findsOneWidget);
    });

    //probamos que se pueda escribir en los campos
    testWidgets('Debe permitir escribir en los campos de texto',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LoginBody(),
            ),
          ),
        ),
      );

      //simulamos escritura en los campos
      await tester.enterText(
          find.byType(CustomTextField).first, 'test@example.com');
      await tester.enterText(find.byType(CustomTextField).last, '123456');
      await tester.pump();

      //verificamos que el texto se haya ingresado
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('123456'), findsOneWidget);
    });

    //probamos el botón de login
    testWidgets('Debe poder presionar el botón de login',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LoginBody(),
            ),
          ),
        ),
      );

      //buscamos y presionamos el botón
      final loginButton = find.byType(MainButton);
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
    });
  });
}
