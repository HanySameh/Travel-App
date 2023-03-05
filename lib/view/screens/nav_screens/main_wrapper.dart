import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../home_screen.dart';
import 'favorite.dart';
import 'mail.dart';
import 'profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late final PageController pageController;
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    Favorite(),
    Mail(),
    Profile(),
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: screens,
        ),
        bottomNavigationBar: WaterDropNavBar(
          bottomPadding: 10.0,
          waterDropColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.white,
          onItemSelected: onTap,
          selectedIndex: currentIndex,
          barItems: [
            BarItem(
              filledIcon: Icons.home_filled,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded,
            ),
            BarItem(
              filledIcon: Icons.mail,
              outlinedIcon: Icons.mail_outline_outlined,
            ),
            BarItem(
              filledIcon: Icons.people,
              outlinedIcon: Icons.people_outline,
            ),
          ],
        ),
      ),
    );
  }
}
