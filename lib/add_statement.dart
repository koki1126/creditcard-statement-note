import 'package:creditcard_statement_note/components/creditcard_statement_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kcustom_input_decoration.dart';
import 'database_helper.dart';

class AddStatement extends StatelessWidget {
  const AddStatement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String inputCardName = '';
    int inputPrice = 0;
    String inputNote = '';

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  inputCardName = value;
                  print(inputCardName);
                },
                decoration: const InputDecoration(
                  labelText: 'カード名',
                  hintText: 'カード名を入力する',
                  enabledBorder: kCustomEnableBorder,
                  focusedBorder: kCustomFocusedBorder,
                  border: kCustomborder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  inputPrice = int.parse(value);
                  print(inputPrice);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: '金額',
                  hintText: '金額を入力する　※必須',
                  enabledBorder: kCustomEnableBorder,
                  focusedBorder: kCustomFocusedBorder,
                  border: kCustomborder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  inputNote = value;
                  print(inputNote);
                },
                decoration: const InputDecoration(
                  labelText: 'メモ',
                  hintText: '何に使ったかを記録',
                  enabledBorder: kCustomEnableBorder,
                  focusedBorder: kCustomFocusedBorder,
                  border: kCustomborder,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print('デバッグ用');
                print(inputCardName);
                print(inputPrice);
                print(inputNote);
                //テスト
                DatabaseHelper().insertCreditCardStatement(
                  CreditcardStatement(
                    //TODO idをユニークなのが入るようにする
                    cardName: inputCardName,
                    price: inputPrice,
                    note: inputNote,
                  ),
                );
                print('保存しました');
              },
              child: const Text('確認用　保存'),
            ),
            TextButton(
              onPressed: () {
                print('出力します');
                printStatement();
                //TODO ここで出力する
              },
              child: const Text('確認用　出力'),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 32),
                ),
              ),
              onPressed: () {
                print('pressed 保存する');
                Navigator.pop(context);
              },
              child: const Text('保存する'),
            ),
          ],
        ),
      ),
    );
  }
}

printStatement() async {
  print(await DatabaseHelper().creditCardStatements());
}
