import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //アプリを縦向き固定
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //デバッグ表示のバナーをオフに
      home: Scaffold(
        body: MainPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'hogehoge' + '円',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lime,
                ),
                child: ListView(
                  children: [
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'test',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
