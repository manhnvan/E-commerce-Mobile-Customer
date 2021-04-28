import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/models/currentBottomNavigationIndex.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  void _setCurrentIndex(BuildContext context, int index) {
    Provider.of<CurrentBottomNavigation>(context, listen: false)
        .changeCurrentIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = Provider.of<CurrentBottomNavigation>(context).getIndex();
    var listRoute = [
      Home.routeName,
      Search.routeName,
      Search.routeName,
      Home.routeName
    ];
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _setCurrentIndex(context, index);
          Navigator.pushNamed(context, listRoute[index]);
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: color_white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_home_inactive.svg'),
              activeIcon: SvgPicture.asset('assets/icons/icon_home_active.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_search_inactive.svg'),
              activeIcon:
              SvgPicture.asset('assets/icons/icon_search_active (1).svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_inbox_inactive.svg'),
              activeIcon:
              SvgPicture.asset('assets/icons/icon_inbox_active.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/icon_inbox_inactive.svg'),
              activeIcon:
              SvgPicture.asset('assets/icons/icon_inbox_active.svg'),
              label: ''),
        ]);
  }
}
