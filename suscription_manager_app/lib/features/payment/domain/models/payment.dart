class Payment {
  final String id;
  final String type;
  final String lastFour;
  final String holderName;
  final String expiryDate;
  final bool isPrimary;
  final String cardType;

  Payment({
    required this.id,
    required this.type,
    required this.lastFour,
    required this.holderName,
    required this.expiryDate,
    required this.isPrimary,
    required this.cardType,
  });

  Payment copyWith({
    String? id,
    String? type,
    String? lastFour,
    String? holderName,
    String? expiryDate,
    bool? isPrimary,
    String? cardType,
  }) {
    return Payment(
      id: id ?? this.id,
      type: type ?? this.type,
      lastFour: lastFour ?? this.lastFour,
      holderName: holderName ?? this.holderName,
      expiryDate: expiryDate ?? this.expiryDate,
      isPrimary: isPrimary ?? this.isPrimary,
      cardType: cardType ?? this.cardType,
    );
  }
}
