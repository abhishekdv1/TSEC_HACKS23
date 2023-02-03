import 'package:barter_app/home.dart';
import 'package:barter_app/search_screen.dart';
import 'package:barter_app/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/drawer_pages/analytics.dart';
import 'package:barter_app/drawer_pages/settings_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScreenHiddenDrawer> pages = [];
  final myTextStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

  @override
  void initState() {
    super.initState();
    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        const Home(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Search',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        const SearchScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Analytics',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        Analytics(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'My Products',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        const MyProducts(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Add Product',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        AddProduct(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Complain',
          baseStyle: myTextStyle,
          selectedStyle: const TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        const MyProducts(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: Colors.deepPurple[100],
      backgroundColorMenu: Colors.deepPurple,
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 40,
    );
  }
}
