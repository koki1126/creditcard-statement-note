import 'package:creditcard_statement_note/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/components/statement.dart';
import 'database_helper.dart';
import 'kconstant.dart';
import 'package:uuid/uuid.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalPage> createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String uuid = const Uuid().v1();
  @override
  void initState() {
    super.initState();
    print('init state in home_page');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kbackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: FutureBuilder(
                    future: databaseHelper.calcCreditcatdStatements(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data.toString()}円',
                          style: const TextStyle(fontSize: 60),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 4,
            child: FutureBuilder<Object>(
              future: databaseHelper.creditCardStatements(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: kbackgroundColor1,
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String id = snapshot.data[index].id;
                        String cardName = snapshot.data[index].cardName;
                        int price = snapshot.data[index].price;
                        String note = snapshot.data[index].note;
                        return Dismissible(
                          // key: ValueKey<String>(
                          //   snapshot.data[index].id,
                          // ), //ウィジェットを特定する
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction) async {
                            await databaseHelper.deleteCreditCardStatement(id);
                            setState(() {});
                          },
                          background: Container(
                            color: kbackgroundColor1,
                            child: const Icon(Icons.delete),
                          ),
                          child: Statement(
                              id: id, cn: cardName, pr: price, nt: note),
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
        ],
      ),
    );
  }
}
