import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/database_helper.dart';

class CreditCard extends StatefulWidget {
  final String cardName;
  const CreditCard({
    required this.cardName,
    Key? key,
  }) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // width: 150,
      child: Card(
        color: Colors.grey[200],
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.lime,
                    child: Center(child: Text(widget.cardName)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.amberAccent,
                    child: const Center(
                      child: const Text('合計金額を入れる'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 59.5,
              child: Center(
                child: Text('ここに明細別のデータを入れる'),
              ),
              // color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
