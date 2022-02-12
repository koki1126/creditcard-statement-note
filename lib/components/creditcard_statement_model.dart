class CreditcardStatement {
  final String id;
  final String cardName;
  final int price;
  final String note;

  CreditcardStatement(
      {required this.id,
      required this.cardName,
      required this.price,
      required this.note});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardName_id': cardName,
      'price': price,
      'note': note,
    };
  }

  @override
  String toString() {
    return 'CreditcardStatement{id:$id, cardName_id: $cardName, price: $price, note: $note}';
  }
}
