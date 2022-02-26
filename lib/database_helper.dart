import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'components/creditcard_statement_model.dart';
import 'dart:async';
import 'migration_scripts.dart';
import 'components/creditcard_model.dart';

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
  openDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "creditcard_statement_note.db");
    database = openDatabase(
      path,
      version: migrationScripts.length,
      onCreate: (Database db, int version) async {
        for (int i = 1; i <= migrationScripts.length; i++) {
          await db.execute(migrationScripts[i].toString());
        }
      },
    );
    return database;
  }

  //取得
  Future<List<CreditcardStatement>> creditCardStatements() async {
    final db = await getDatabase;
    final List<Map<String, dynamic>> maps = await db.query('statements');

    List<CreditcardStatement> statementList = List.generate(
      maps.length,
      (i) {
        return CreditcardStatement(
          id: maps[i]['id'],
          cardName: maps[i]['cardName_id'],
          price: maps[i]['price'],
          note: maps[i]['note'],
        );
      },
    );
    return statementList;
  }

  //合計金額を取得
  Future<int> calcCreditcatdStatements() async {
    int sum = 0;
    final db = await getDatabase;
    final List<Map<String, dynamic>> maps = await db.query('statements');
    for (int i = 0; i < maps.length; i++) {
      int price = maps[i]['price'];
      sum = sum + price;
    }
    return sum;
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
  Future<void> deleteCreditCardStatement(String id) async {
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

  //クレジット　挿入
  Future<void> insertCreditCard(Creditcard creditcard) async {
    getDatabase;
    final db = await database;
    await db.insert(
      'cardName',
      creditcard.toMap(),
    );
  }

  //クレジット　取得
  Future<List<Creditcard>> creditCardList() async {
    final db = await getDatabase;
    final List<Map<String, dynamic>> maps = await db.query('cardName');

    List<Creditcard> creditCardList = List<Creditcard>.generate(
      maps.length,
      (i) {
        return Creditcard(
          id: maps[i]['id'],
          creditCardName: maps[i]['creditCardName'],
        );
      },
    );
    return creditCardList;
  }
}
