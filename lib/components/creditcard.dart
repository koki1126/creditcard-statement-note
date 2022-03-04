import 'package:creditcard_statement_note/kconstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/database_helper.dart';

class CreditCard extends StatefulWidget {
  final String cardName;
  final dynamic sumPrice;
  final dynamic child;
  const CreditCard({
    required this.cardName,
    required this.sumPrice,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                    color: kbackgroundColor2,
                    child: Center(child: Text(widget.cardName)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: kbackgroundColor2,
                    child: Center(
                      child: Text('${widget.sumPrice.toString()}円'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                height: 142,
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
