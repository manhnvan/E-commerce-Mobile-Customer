import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:customer_app/models/currentBottomNavigationIndex.dart';

class BottomNavbar extends StatelessWidget {
  void _setCurrentIndex(BuildContext context, int index) {
    Provider.of<CurrentBottomNavigation>(context, listen: false).changeCurrentIndex(index);
  }
  @override
  Widget build(BuildContext context) {

    var currentIndex = Provider.of<CurrentBottomNavigation>(context).getIndex();

    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _setCurrentIndex(context, index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.blue
          )
        ]
    );
  }
}
