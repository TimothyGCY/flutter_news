import 'package:flutter/material.dart';
import 'package:flutter_news/views/account.dart';
import 'package:flutter_news/views/favorite.dart';
import 'package:flutter_news/views/home.dart';
import 'package:flutter_news/views/search.dart';

class NavBar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _navView = [
    Home(),
    Search(),
    Favorite(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _navView.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        items: _navbarList.map((item) => BottomNavigationBarItem(icon: item.icon, activeIcon: item.activeIcon, title: Text(item.title))).toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
//        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class NavbarItem {
  final Icon icon;
  final Icon activeIcon;
  final String title;
  NavbarItem({this.icon, this.activeIcon, this.title});
}

List<NavbarItem> _navbarList = [
  NavbarItem(
    icon: Icon(Icons.home, color: Colors.grey),
    activeIcon: Icon(Icons.home, color: Colors.black),
    title: "Home",
  ),
  NavbarItem(
    icon: Icon(Icons.search, color: Colors.grey),
    activeIcon: Icon(Icons.search, color: Colors.black),
    title: "Search",
  ),
  NavbarItem(
    icon: Icon(Icons.favorite, color: Colors.grey),
    activeIcon: Icon(Icons.favorite, color: Colors.black),
    title: "Favourite",
  ),
  NavbarItem(
    icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
    activeIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
    title: "Account",
  ),
];