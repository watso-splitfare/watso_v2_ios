import 'package:flutter/material.dart';

import '../constants/styles.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({super.key, required this.body});

  final Widget body;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WatsoColor.background,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: WatsoColor.background,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text(
            "택시왔소",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("검색");
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("더보기");
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: widget.body,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: '이용서비스',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '내 정보',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ));
  }
}
