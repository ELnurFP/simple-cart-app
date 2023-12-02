class DebitCard {
  final String cardNumber;
  final double balance;

  DebitCard({
    required this.cardNumber,
    this.balance = 10.0,
  });

  DebitCard copyWith({
    String? cardNumber,
    double? balance,
  }) {
    return DebitCard(
      cardNumber: cardNumber ?? this.cardNumber,
      balance: balance ?? this.balance,
    );
  }
}
