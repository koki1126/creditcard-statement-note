import 'package:creditcard_statement_note/database_helper.dart';
import 'package:creditcard_statement_note/home_page.dart';
import 'package:creditcard_statement_note/kconstant.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'components/creditcard_model.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String? inputCardName;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: FutureBuilder<Object>(
              future: databaseHelper.creditCardList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      // color: Colors.lime,
                      color: kbackgroundColor1,
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String id = snapshot.data[index].id;
                        String creditCardName =
                            snapshot.data[index].creditCardName;
                        return Text(
                          'id:$id, creditCardName:$creditCardName',
                          style: TextStyle(fontSize: 30),
                        );
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
                  ),
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
                        setState(() {
                          _controller.clear();
                        });
                      }
                    },
                    child: Text(
                      '追加する',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: Text('ここに広告を入れる'),
            ),
          ),
        ],
      ),
    );
  }
}
