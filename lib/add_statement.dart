import 'package:creditcard_statement_note/components/creditcard_statement_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kconstant.dart';
import 'database_helper.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    if (cardList.length == 1) {}
  }

  //クレジットカードのリストを作成
  insertCardList() async {
    dynamic n = await databaseHelper.creditCardList();
    for (int i = 0; i < n.length; i++) {
      cardList.add(n[i].creditCardName);
    }
    if (cardList.length == 1) {
      Fluttertoast.showToast(
        msg: 'クレジットカードを追加してください',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
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
        title: const Text(
          '明細を追加する',
          style: TextStyle(
            color: kbackgroundColor3,
          ),
        ),
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

                if (inputPrice != null && selectedIndex != 0) {
                  //金額入力○ カード選択○ の場合
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
                } else if (inputPrice != null && selectedIndex == 0) {
                  //金額入力○ カード選択✗ の場合
                  Fluttertoast.showToast(
                    msg: 'カードを選択してください',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else if (inputPrice == null && selectedIndex != 0) {
                  //金額入力✗ カード選択○ の場合
                  Fluttertoast.showToast(
                    msg: '金額を入力してください',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  //金額入力✗ カード選択✗ の場合
                  Fluttertoast.showToast(
                    msg: 'カードを選択して金額を入力してください',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 3,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
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
