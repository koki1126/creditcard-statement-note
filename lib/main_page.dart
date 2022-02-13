import 'package:flutter/material.dart';
import 'edit_creditcard.dart';
import 'home_page.dart';
import 'database_helper.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  var _pages = <Widget>[
    TotalPage(),
    EditCard(),
  ];
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future(
      () async {
        await DatabaseHelper().openDB();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: '明細を追加します',
        onPressed: () async {
          print('pressed add button');
          await Navigator.pushNamed(context, '/add_statement');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            tooltip: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'カードを追加',
            tooltip: 'クレジットカードを追加・編集します',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
