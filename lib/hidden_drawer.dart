import 'package:barter_app/drawer_pages/add_product.dart';
import 'package:barter_app/drawer_pages/analytics.dart';
import 'package:barter_app/drawer_pages/home_page.dart';
import 'package:barter_app/drawer_pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> pages = [];
  final myTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

  @override
  void initState() {
    super.initState();
    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Add',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        AddProduct(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Analytics',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        Analytics(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'My Products',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        SettingsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'About Us',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        SettingsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Complain',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          colorLineSelected: Colors.deepPurple,
        ),
        SettingsPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple,
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 40,
    );
  }
}
