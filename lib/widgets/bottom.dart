import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constand.dart';

class BottomNavBar extends StatefulWidget {

  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: blue,
      backgroundColor: Colors.black,
      iconSize: 15,
      selectedFontSize: 13,
      unselectedFontSize: 10,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'Favourite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_sharp), label: 'Account')
      ],
    );
  }
}
