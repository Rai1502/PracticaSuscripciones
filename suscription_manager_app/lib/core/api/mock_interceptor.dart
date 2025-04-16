import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:suscription_manager_app/core/constants/api_constants.dart';

class MockInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String jsonString =
        await rootBundle.loadString('assets/mocks/payment_methods.json');
    final mockData = json.decode(jsonString);

    await Future.delayed(const Duration(seconds: 1));

    if (options.method == 'PUT' && options.path.contains('/primary')) {
      return handler.resolve(Response(
        requestOptions: options,
        data: mockData['endpoints']['set_primary_payment_method']['response']
            ['data'],
        statusCode: 200,
      ));
    }

    switch (options.path) {
      case ApiConstants.payments:
        switch (options.method) {
          case 'GET':
            return handler.resolve(Response(
              requestOptions: options,
              data: mockData['endpoints']['get_payment_methods']['response']
                  ['data'],
              statusCode: 200,
            ));
          case 'POST':
            return handler.resolve(Response(
              requestOptions: options,
              data: mockData['endpoints']['add_payment_method']['response']
                  ['data'],
              statusCode: 201,
            ));

          // Otros casos...
        }
    }
    return handler.next(options);
  }
}
