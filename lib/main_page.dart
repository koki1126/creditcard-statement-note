import 'package:creditcard_statement_note/add_statement.dart';
import 'package:flutter/material.dart';
import 'edit_creditcard.dart';
import 'home_page.dart';
import 'database_helper.dart';
import 'kconstant.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  var _pages = <Widget>[
    TotalPage(),
    AddStatement(),
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
      backgroundColor: kbackgroundColor1,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kbackgroundColor3,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: kbackgroundColor2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            tooltip: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '追加する',
            tooltip: '明細を追加します',
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
