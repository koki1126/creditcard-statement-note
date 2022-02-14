import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/kconstant.dart';

class Statement extends StatelessWidget {
  final String cn;
  final int pr;
  final String nt;

  const Statement(
      {required this.cn, required this.pr, required this.nt, Key? key})
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
                        style: TextStyle(
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
                        style: TextStyle(
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
      // child: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           color: Colors.orange,
      //           height: 40,
      //         ),
      //         Positioned(
      //           bottom: 16,
      //           right: 16,
      //           left: 16,
      //           child: Text(
      //             cn,
      //             style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //               fontSize: 24,
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           bottom: 16,
      //           right: 16,
      //           left: 200,
      //           child: Text(
      //             '$pr円',
      //             style: const TextStyle(
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white,
      //               fontSize: 24,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(56).copyWith(bottom: 0),
      //       child: Text(
      //         nt,
      //         style: const TextStyle(fontSize: 20),
      //       ),
      //     ),
      //     ButtonBar(
      //       alignment: MainAxisAlignment.start,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () {},
      //           child: const Text('編集'),
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.transparent,
      //             elevation: 0,
      //             onPrimary: Colors.blue,
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
      // ),
    );
  }
}
