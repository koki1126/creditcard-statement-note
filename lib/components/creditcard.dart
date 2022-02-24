import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String id;
  final String cardName;
  const CreditCard({
    required this.id,
    required this.cardName,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //TODO 比率をクレジットカードのように修正する
      height: 200,
      width: 150,
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
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.amberAccent,
                  ),
                )
              ],
            ),
            Container(
              height: 59.5,
              // color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
