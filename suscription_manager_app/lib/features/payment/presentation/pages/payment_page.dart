import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/features/payment/presentation/pages/add_payment_page.dart';
import 'package:suscription_manager_app/features/payment/presentation/providers/payment_providers.dart';
import 'package:suscription_manager_app/features/payment/presentation/widgets/payment_card.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  @override
  void initState() {
    super.initState();

    // Cargar los métodos de pago al iniciar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(paymentControllerProvider).getPayments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentNotifierProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 66, 248),
          title: const Text(
            'Métodos de Pago',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 5.0,
          automaticallyImplyLeading: false,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddPaymentPage())),
        backgroundColor: const Color.fromARGB(255, 0, 66, 248),
        elevation: 6,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: paymentState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : paymentState.payments.isEmpty
              ? const Center(
                  child: Text('No hay métodos de pago registrados'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: paymentState.payments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final payment = paymentState.payments[index];
                    return PaymentCard(
                      payment: payment,
                      onSetPrimary: () {
                        ref
                            .read(paymentControllerProvider)
                            .setPrimaryPayment(payment.id);
                      },
                    );
                  },
                ),
    );
  }
}
