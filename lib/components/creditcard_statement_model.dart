class CreditcardStatement {
  final String cardName;
  final int price;
  final String note;

  CreditcardStatement(
      {required this.cardName, required this.price, required this.note});

  Map<String, dynamic> toMap() {
    return {
      'cardName': cardName,
      'price': price,
      'note': note,
    };
  }

  @override
  String toString() {
    return 'CreditcardStatement{cardName: $cardName, price: $price, note: $note}';
  }
}
