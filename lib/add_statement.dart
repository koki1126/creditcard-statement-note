import 'package:creditcard_statement_note/components/creditcard.dart';
import 'package:creditcard_statement_note/components/creditcard_model.dart';
import 'package:creditcard_statement_note/components/creditcard_statement_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kconstant.dart';
import 'database_helper.dart';
import 'package:uuid/uuid.dart';

class AddStatement extends StatefulWidget {
  AddStatement({Key? key}) : super(key: key);

  @override
  State<AddStatement> createState() => _AddStatementState();
}

class _AddStatementState extends State<AddStatement> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  int selectedIndex = 0;
  List<Text> list = [];
  List<String> cardList = ['カードを選択します'];

  //cupertinoPickerようにウィジェットに変換
  cardListText() {
    for (int i = 0; i < cardList.length; i++) {
      list.add(Text(cardList[i]));
    }
  }

  //クレジットカードのリストを作成
  insertCardList() async {
    dynamic n = await databaseHelper.creditCardList();
    for (int i = 0; i < n.length; i++) {
      cardList.add(n[i].creditCardName);
    }
  }

  @override
  void initState() {
    super.initState();
    print('init state in add_statement');
    insertCardList();
    cardListText();
  }

  @override
  Widget build(BuildContext context) {
    int? inputPrice;
    String inputNote = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('明細を追加する'),
        backgroundColor: kbackgroundColor1,
      ),
      backgroundColor: kbackgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: FutureBuilder(
                future: databaseHelper.creditCardList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: CupertinoPicker(
                        itemExtent: 30,
                        onSelectedItemChanged: (int value) {
                          selectedIndex = value;
                          print(selectedIndex);
                        },
                        children: [
                          for (int i = 0; i < cardList.length; i++) ...[
                            Text(cardList[i])
                          ]
                        ]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                maxLength: 6,
                onChanged: (value) {
                  try {
                    inputPrice = int.parse(value);
                    print(inputPrice);
                  } catch (e) {
                    print('0桁になりました');
                  }
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
                maxLength: 100,
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
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kbackgroundColor2),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 32),
                ),
              ),
              onPressed: () async {
                await databaseHelper.creditCardList().toString();
                print('保存します');
                if (inputPrice != 0 && selectedIndex != 0) {
                  var uuid = const Uuid().v1(); //ユニークなIDを作成する
                  await databaseHelper.insertCreditCardStatement(
                    CreditcardStatement(
                      id: uuid,
                      cardName: cardList[selectedIndex].toString(),
                      price: inputPrice!,
                      note: inputNote,
                    ),
                  );
                  print('保存しました');
                  Navigator.pushNamed(context, '/');
                } else {
                  //以下のif文の表示を書く
                  if (inputPrice == 0 && selectedIndex == 0) {
                    print('価格を入力してください');
                    print('カードを選択してください');
                  } else if (inputPrice == 0) {
                    print('価格を入力してください');
                  } else {
                    print('カードを選択してください');
                  }
                }
              },
              child: const Text(
                '保存する',
                style: TextStyle(
                  color: kbackgroundColor3,
                ),
              ),
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
