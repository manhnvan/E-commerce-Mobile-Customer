import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/ChatScreen/ChatScreen.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/search.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  
  BottomNavbar(this.currentIndex);

  int currentIndex;

  final listWidget = [
    Home.routeName,
    Search.routeName,
    ChatScreen.routeName,
    Search.routeName,
  ];

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        onTap: (index) {
          if (index == this.currentIndex) {
            return;
          }
          Navigator.pushNamed(context, listWidget[index]);
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: color_white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'MESSAGE'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'PROFILE'
          ),
        ]);
  }
}
