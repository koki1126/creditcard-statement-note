import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'components/creditcard_statement_model.dart';
import 'dart:async';

class DatabaseHelper {
  dynamic database;

  //データベースを取得する
  Future<dynamic> get getDatabase async {
    if (database != null) {
      return database;
    } else {
      database = openDB();
      return database;
    }
  }

  //データベースを開く
  Future<dynamic> openDB() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'creditcard_statement_note'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE statements(id INTEGER PRIMARY KEY AUTOINCREMENT , cardName TEXT, price INTEGER, note TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  //取得
  Future<List<CreditcardStatement>> creditCardStatements() async {
    getDatabase;
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('statements');
    return List.generate(maps.length, (i) {
      return CreditcardStatement(
        cardName: maps[i]['cardName'],
        price: maps[i]['price'],
        note: maps[i]['note'],
      );
    });
  }

  // 挿入
  Future<void> insertCreditCardStatement(
      CreditcardStatement creditcardStatement) async {
    getDatabase;
    final db = await database;
    await db.insert(
      'statements',
      creditcardStatement.toMap(),
    );
  }

  //削除
  Future<void> deleteCreditCardStatement(int id) async {
    final db = await database;
    await db.delete(
      'statements',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //更新
  Future<void> updateCreditCsrdStatement(
      CreditcardStatement creditcardStatement) async {
    final db = await database;
    await db.update(
      'statements',
      creditcardStatement.toMap(),
      where: 'id = ?',
      // whereArgs: [creditcardStatement.id],
    );
  }

  //
}
