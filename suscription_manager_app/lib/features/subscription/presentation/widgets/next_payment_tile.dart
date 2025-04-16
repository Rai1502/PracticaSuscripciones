import 'package:flutter/material.dart';

class NextPaymentTile extends StatelessWidget {
  const NextPaymentTile({super.key, required this.date, required this.amount});

  final DateTime date;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Proximo pago: '),
      subtitle:
          Text('${_formatDate(date)} \n' '\$${amount.toStringAsFixed(2)}'),
      leading: const Icon(
        Icons.calendar_today,
        color: Color.fromARGB(255, 33, 61, 243),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
