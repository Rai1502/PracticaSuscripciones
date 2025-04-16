import 'package:flutter/material.dart';
import 'package:suscription_manager_app/core/domain/models/user.dart';

class SubscriptionStatusTile extends StatelessWidget {
  const SubscriptionStatusTile({super.key, required this.status});

  final SubscriptionStatus status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Suscripción: '),
      trailing: Chip(
        label: Text(
          _getStatusText(status),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: _getStatusColor(status),
      ),
    );
  }

  String _getStatusText(SubscriptionStatus status) {
    switch (status) {
      case SubscriptionStatus.active:
        return 'ACTIVA';
      case SubscriptionStatus.cancelled:
        return 'CANCELADA';
      case SubscriptionStatus.trial:
        return 'PRUEBA';
    }
  }

  Color _getStatusColor(SubscriptionStatus status) {
    switch (status) {
      case SubscriptionStatus.active:
        return Colors.green;
      case SubscriptionStatus.cancelled:
        return Colors.red;
      case SubscriptionStatus.trial:
        return Colors.orange;
    }
  }
}
