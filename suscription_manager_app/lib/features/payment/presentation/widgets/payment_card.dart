import 'package:flutter/material.dart';
import 'package:suscription_manager_app/core/widgets/main_button.dart';
import 'package:suscription_manager_app/features/payment/domain/models/payment.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key, required this.payment, required this.onSetPrimary});

  final Payment payment;
  final VoidCallback onSetPrimary;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
            leading: Icon(
              payment.cardType.toLowerCase() == 'visa'
                  ? Icons.credit_card
                  : Icons.credit_card_off_outlined,
              color: payment.isPrimary
                  ? const Color.fromARGB(255, 0, 66, 248)
                  : Colors.grey,
            ),
            title: Text(
              '**** **** **** ${payment.lastFour}',
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              'Expira: ${payment.expiryDate}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (payment.isPrimary)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Chip(
                      label: const Text("Principal"),
                      backgroundColor: const Color.fromARGB(255, 0, 66, 248)
                          .withOpacity(0.2),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 66, 248),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  )
                else
                  MainButton(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('¿Establecer como principal?'),
                          content: const Text(
                              '¿Seguro que deseas establecer esta tarjeta como tu método de pago principal?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancelar'),
                            ),
                            MainButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              text: 'Sí',
                              width: 75,
                            ),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        onSetPrimary();
                      }
                    },
                    text: 'Elegir',
                    width: 87,
                    height: 30,
                  ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.red[300],
                )
              ],
            )));
  }
}
