import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/features/subscription/presentation/providers/subscription_providers.dart';
import 'package:suscription_manager_app/features/subscription/presentation/widgets/subscription_card.dart';

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subscriptionNotifierProvider);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 0, 66, 248),
            title: const Text(
              'My Subscription',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            elevation: 5.0,
            automaticallyImplyLeading: false,
          )),
      body: SafeArea(
          child: state.user != null
              ? Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SubscriptionCard(user: state.user!),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
