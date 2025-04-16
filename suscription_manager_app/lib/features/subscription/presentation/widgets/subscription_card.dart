import 'package:flutter/material.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';
import 'package:suscription_manager_app/core/utils/logger.dart';
import 'package:suscription_manager_app/features/payment/presentation/pages/payment_page.dart';
import 'package:suscription_manager_app/features/subscription/presentation/widgets/next_payment_tile.dart';
import 'package:suscription_manager_app/features/subscription/presentation/widgets/subscription_status.tile.dart';
import 'package:suscription_manager_app/features/subscription/presentation/widgets/user_info_tile.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: const EdgeInsets.all(16.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          UserInfoTile(user: user),
          const Divider(),
          SubscriptionStatusTile(status: user.subscriptionStatus),
          const Divider(),
          NextPaymentTile(
              date: user.nextPaymentDate, amount: user.nextPaymentAmount),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.credit_card,
                color: Color.fromARGB(255, 33, 61, 243)),
            title: const Text('Métodos de pago'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              logger.d('Métodos de pago');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
