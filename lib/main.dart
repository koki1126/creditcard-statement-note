import 'package:flutter/material.dart';

void main() {
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
