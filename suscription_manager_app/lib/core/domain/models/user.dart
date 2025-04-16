enum SubscriptionStatus {
  active,
  cancelled,
  trial,
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.subscriptionStatus,
    required this.nextPaymentDate,
    required this.nextPaymentAmount,
  });

  final String id;
  final String name;
  final String email;
  final String token;
  final SubscriptionStatus subscriptionStatus;
  final DateTime nextPaymentDate;
  final double nextPaymentAmount;
}
