import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CreditcardStatement {
  final int id;
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
      'cardName': cardName,
      'price': price,
      'note': note,
    };
  }

  @override
  String toString() {
    return 'CreditcardStatement{id: $id, cardName: $cardName, price: $price, note: $note}';
  }
}
