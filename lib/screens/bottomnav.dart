import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'user.dart';

class Mybottom extends StatefulWidget {
  @override
  State<Mybottom> createState() => _MybottomState();
}

class _MybottomState extends State<Mybottom> {
  int currentIndex = 0;
  int selectedPage = 0;
  bool isLoading = false;
  final _pageOptions = [
    HomeScreen(),
    //CartDetails(),
    //QuizScreen(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: selectedPage,
        backgroundColor: Colors.deepOrange.shade50,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          // icon: Icon(Icons.book_sharp), label: 'MyBooks',),
          //BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Test'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        elevation: 5.0,
        onTap: (index) {
          setState(() {
            isLoading = true;
            selectedPage = index;
          });
        },
      ),
    );
  }
}
