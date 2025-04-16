import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suscription_manager_app/core/widgets/main_button.dart';
import 'package:suscription_manager_app/features/payment/presentation/providers/payment_providers.dart';
import 'package:suscription_manager_app/features/payment/presentation/widgets/custom_text_field.dart';

class AddPaymentPage extends ConsumerStatefulWidget {
  const AddPaymentPage({super.key});

  @override
  ConsumerState<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends ConsumerState<AddPaymentPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController? _cardNumberController;
  late TextEditingController? _holderNameController;
  late TextEditingController? _expiryDateController;

  // Focus Nodes
  final _cardNumberFocus = FocusNode();
  final _holderNameFocus = FocusNode();
  final _expiryDateFocus = FocusNode();

  String _selectedCardType = 'visa';
  bool _isPrimary = false;

  @override
  void dispose() {
    _cardNumberController?.dispose();
    _holderNameController?.dispose();
    _expiryDateController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _holderNameController = TextEditingController();
    _expiryDateController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(paymentControllerProvider);
      notifier.setCardNumber('');
      notifier.setHolderName('');
      notifier.setExpiryDate('');

      _cardNumberController?.text =
          ref.read(paymentNotifierProvider).cardNumber;
      _holderNameController?.text =
          ref.read(paymentNotifierProvider).holderName;
      _expiryDateController?.text =
          ref.read(paymentNotifierProvider).expiryDate;
    });
  }

  //metodos de validacion de cada campo del formulario
  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número de tarjeta es requerido';
    }
    if (value.length != 16) {
      return 'El número debe tener 16 dígitos';
    }
    return null;
  }

  String? _validateHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre del titular es requerido';
    }
    return null;
  }

  String? _validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La fecha de expiración es requerida';
    }
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'Formato inválido (MM/YY)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentNotifierProvider);
    final paymentController = ref.read(paymentControllerProvider);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 0, 66, 248),
            title: const Text(
              'Nuevo Método de Pago',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 5.0,
            automaticallyImplyLeading: false,
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedCardType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Tarjeta',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'visa', child: Text('Visa')),
                    DropdownMenuItem(
                        value: 'mastercard', child: Text('Mastercard')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCardType = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _cardNumberController,
                  focusNode: _cardNumberFocus,
                  nextFocusNode: _holderNameFocus,
                  label: 'Número de Tarjeta',
                  maxLength: 16,
                  validator: _validateCardNumber,
                  onChanged: ref.read(paymentControllerProvider).setCardNumber,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _holderNameController,
                  focusNode: _holderNameFocus,
                  nextFocusNode: _expiryDateFocus,
                  label: 'Nombre del Titular',
                  validator: _validateHolderName,
                  onChanged: ref.read(paymentControllerProvider).setHolderName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: _expiryDateController,
                  focusNode: _expiryDateFocus,
                  label: 'Fecha de Expiración (MM/YY)',
                  maxLength: 5,
                  validator: _validateExpiryDate,
                  onChanged: ref.read(paymentControllerProvider).setExpiryDate,
                ),
                const SizedBox(height: 16),
                MainButton(
                  text: 'Crear Tarjeta',
                  onPressed: () => paymentController.addPayment(
                      onSuccess: () => Navigator.pop(context)),
                  isLoading: paymentState.isLoading,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
