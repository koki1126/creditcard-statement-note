import 'package:creditcard_statement_note/components/creditcard.dart';
import 'package:flutter/material.dart';

class Statement extends StatelessWidget {
  final String id;
  final String cn;
  final int pr;
  final String nt;

  const Statement(
      {required this.id,
      required this.cn,
      required this.pr,
      required this.nt,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  flex: 5,
                  child: Container(
                    height: 30,
                    color: Colors.amberAccent,
                    child: Center(
                      child: Text(
                        cn,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        '$pr円',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              // color: Colors.pink,
              child: Text(
                nt,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
