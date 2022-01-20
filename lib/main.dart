import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'add_statement.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';
import 'edit_creditcard.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'database_helper.dart';

void main() async {
  //アプリを縦向きに固定
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //open DB and store the reference.
  final database = openDatabase(
    join(await getDatabasesPath(), 'creditcard_statement_note'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE statements(id INTEGER PRIMARY KEY, cardName TEXT, price INTEGER, note TEXT)',
      );
    },
    version: 1,
  );
  Future<void> insertCreditcardStatement(
      CreditcardStatement creditcardStatement) async {
    final db = await database;
    await db.insert(
      'creditcard_statement_note',
      creditcardStatement.toMap(),
      //TODO conflictalgorithm
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //デバッグ表示のバナーをオフに
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MainPage(),
        '/add_statement': (context) => AddStatement(),
        '/edit_creditcard': (context) => EditCard(),
      },
    );
  }
}
