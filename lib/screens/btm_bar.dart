import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glocery_app/provider/dark_theme_provider.dart';
import 'package:glocery_app/screens/cart/cart_screen.dart';
import 'package:glocery_app/screens/categories.dart';
import 'package:glocery_app/screens/home_screen.dart';
import 'package:glocery_app/screens/user.dart';
import 'package:provider/provider.dart';

class ButtomBarScreen extends StatefulWidget {
  const ButtomBarScreen({Key? key}) : super(key: key);

  @override
  State<ButtomBarScreen> createState() => _ButtomBarScreenState();
}

class _ButtomBarScreenState extends State<ButtomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': HomeScreen(), 'title': "Home Screen"},
    {'page': CategoriesScreen(), 'title': "Categories Screen"},
    {'page': const CartScreen(), 'title': "Cart Screen"},
    {'page': const UserScreen(), 'title': "User Screen"},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
      ),
    );
  }
}
