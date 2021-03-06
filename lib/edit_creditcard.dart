import 'package:creditcard_statement_note/components/creditcard.dart';
import 'package:creditcard_statement_note/database_helper.dart';
import 'package:creditcard_statement_note/kconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'components/creditcard_model.dart';
import 'components/creditcard_statement_model.dart';
import 'kconstant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String? inputCardName;
  List statements = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('init state in edit_creditcard');
    getStatementData();
  }

  // カード毎の合計金額
  Map cardSumList = {};

  //カード毎の明細合計
  Map cardStatementList = {};

  getStatementData() async {
    List n = await databaseHelper.creditCardStatements();
    //print(n);

    for (CreditcardStatement record in n) {
      //print(record.getCardName);
      // 取り出してきたレコードのカードidが既に存在するか

      //合計金額を計算する
      if (cardSumList.containsKey(record.getCardName)) {
        //既に存在しているvalueの金額と合計する
        cardSumList[record.getCardName.toString()] += record.getPrice;
      } else {
        //なかった場合keyを作る
        cardSumList[record.getCardName.toString()] = record.getPrice;
      }

      //カード別の明細のリストを作成
      if (cardStatementList.containsKey(record.getCardName)) {
        cardStatementList[record.getCardName.toString()]
            .add([record.getNote, record.getPrice]);
      } else {
        //なかった場合keyを作る
        cardStatementList[record.getCardName.toString()] = [];
        cardStatementList[record.getCardName.toString()]
            .add([record.getNote, record.getPrice]);
      }
      print('------------------');
      print(cardSumList);
      print(cardStatementList);
    }
    //print(cardSumList);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: FutureBuilder<Object>(
                future: databaseHelper.creditCardList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: kbackgroundColor1,
                      ),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String creditCardName =
                              snapshot.data[index].creditCardName;
                          String id = snapshot.data[index].id;

                          if (cardSumList[creditCardName] != null) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 200,
                                child: CreditCard(
                                  cardName: creditCardName,
                                  sumPrice: cardSumList[creditCardName],
                                  child: ListView.builder(
                                    itemCount: cardStatementList[creditCardName]
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: 20,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                      cardStatementList[
                                                                  creditCardName]
                                                              [index][0]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    '${cardStatementList[creditCardName][index][1].toString()}円',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 200,
                                child: CreditCard(
                                  cardName: creditCardName,
                                  sumPrice: 0,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('明細はありません'),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: kbackgroundColor2,
                                            ),
                                            onPressed: null,
                                            onLongPress: () async {
                                              print('ボタンが押されました');
                                              print(id);
                                              await databaseHelper
                                                  .deleteCreditCardList(id);
                                              setState(() {
                                                print('setstateが発動');
                                              });
                                            },
                                            child: const Text(
                                                '長押しでクレジットカードを削除します')),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: _controller,
                        maxLength: 15,
                        onChanged: (value) {
                          inputCardName = value;
                          print(value);
                        },
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: kbackgroundColor3),
                          hintText: 'カード名を入力してください',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kbackgroundColor2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kbackgroundColor2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kbackgroundColor3,
                        ),
                        onPressed: () async {
                          print('inputCardName:[$inputCardName]保存ボタンを押したよ');
                          if (inputCardName != null) {
                            String uuid = const Uuid().v1();
                            await databaseHelper.insertCreditCard(
                              Creditcard(
                                id: uuid,
                                creditCardName: inputCardName!,
                              ),
                            );
                            print('保存しました');
                            _controller.clear();
                            inputCardName = null;
                            setState(() {});
                          } else {
                            Fluttertoast.showToast(
                              msg: 'カード名を入力してください',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              // timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        child: const Text(
                          '登録する',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: SizedBox(
            //     height: 30,
            //     child: Text('ここに広告を入れる'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
