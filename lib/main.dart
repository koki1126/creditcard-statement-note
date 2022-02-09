import 'package:flutter/material.dart';
import 'add_statement.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';
import 'edit_creditcard.dart';
import 'package:flutter/widgets.dart';

void main() async {
  //アプリを縦向きに固定
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //デバッグ表示のバナーをオフに
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const MainPage(),
        '/add_statement': (context) => const AddStatement(),
        '/edit_creditcard': (context) => const EditCard(),
      },
    );
  }
}
