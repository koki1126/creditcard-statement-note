class Creditcard {
  final String id;
  final String creditCardName;

  const Creditcard({
    required this.id,
    required this.creditCardName,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creditCardName': creditCardName,
    };
  }

  @override
  String toString() {
    return 'CreditCard{id:$id, creditCardName:$creditCardName}';
  }
}
