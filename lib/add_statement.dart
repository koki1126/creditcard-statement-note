import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kcustom_input_decoration.dart';

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
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
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: '金額',
                  hintText: '金額を入力する',
                  enabledBorder: kCustomEnableBorder,
                  focusedBorder: kCustomFocusedBorder,
                  border: kCustomborder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'メモ',
                  hintText: '何に使ったかを記録',
                  enabledBorder: kCustomEnableBorder,
                  focusedBorder: kCustomFocusedBorder,
                  border: kCustomborder,
                ),
              ),
            ),

            // const CustomTextField(
            //   labelText: 'カード名',
            //   hintText: 'カード名を入力',
            // ),
            // const CustomTextField(
            //   labelText: '金額',
            //   hintText: '金額を入力',
            //   keyboardType: TextInputType.number,
            //   // TODO digit onlyにする
            // ),
            // const CustomTextField(
            //   labelText: 'メモ',
            //   hintText: '使った場所など(※必須)',
            // ),
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
              child: Text('保存する'),
            ),
          ],
        ),
      ),
    );
  }
}
