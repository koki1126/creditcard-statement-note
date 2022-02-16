import 'package:creditcard_statement_note/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/components/statement.dart';
import 'components/statement.dart';
import 'database_helper.dart';
import 'kconstant.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalPage> createState() => _TotalPageState();
}

DatabaseHelper databaseHelper = DatabaseHelper();

class _TotalPageState extends State<TotalPage> {
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
                  // color: Colors.lime,
                  color: kbackgroundColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: FutureBuilder(
                    future: databaseHelper.calcCreditcatdStatements(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(fontSize: 80),
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
            //TODO StreamBuilderで書き換える
            child: FutureBuilder<Object>(
              future: databaseHelper.creditCardStatements(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    decoration: const BoxDecoration(
                      // color: Colors.lime,
                      color: kbackgroundColor1,
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String cardName = snapshot.data[index].cardName;
                        int price = snapshot.data[index].price;
                        String note = snapshot.data[index].note;
                        return Statement(cn: cardName, pr: price, nt: note);
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
