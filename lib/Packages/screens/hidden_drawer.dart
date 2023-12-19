import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:travelexperience/Packages/screens/Home.dart';
import 'package:travelexperience/Packages/screens/diary.dart';
import 'package:travelexperience/Packages/screens/location.dart';
import 'package:travelexperience/Packages/screens/suggestions.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final myTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color(0xffFFF7043),
        ),
        Home(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Diary",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color(0xffFFF7043),
        ),
        DiaryPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Location",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color(0xffFFF7043),
        ),
        LocationPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Suggestions",
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color(0xffFFF7043),
        ),
        SuggestionsPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages,
        initPositionSelected: 0,
        slidePercent: 50,
        contentCornerRadius: 15,
        backgroundColorMenu: Color(0xffFFFFF3E0));
  }
}
