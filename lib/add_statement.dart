// 金額を入力する画面を作る

import 'package:flutter/material.dart';

class AddStatement extends StatelessWidget {
  const AddStatement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カード名'),
            Text('金額'),
            Text('メモ'),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 32),
                ),
              ),
              onPressed: () {
                print('pressed 保存する');
                Navigator.pop(context);
              },
              child: Text('保存する'),
            ),
          ],
        ),
      ),
    );
  }
}
