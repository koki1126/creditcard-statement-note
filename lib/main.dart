import 'package:flutter/material.dart';
import 'add_statement.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';
import 'edit_creditcard.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

void main() async {
  //スマホだった場合縦向き固定
  print(Device.get());
  if (Device.get().isTablet != true) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

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
