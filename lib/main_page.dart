import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO ボディを切り分ける
      body: SafeArea(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add_statement');
        },
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
    );
  }
}
