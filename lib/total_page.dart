import 'package:creditcard_statement_note/components/creditcard_statement_model.dart';
import 'package:creditcard_statement_note/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:creditcard_statement_note/components/statement.dart';
import 'components/statement.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

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
                  color: Colors.lime,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '10,000円',
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
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.lime,
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const Statement();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
