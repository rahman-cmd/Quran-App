import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'package:quran_app/screens/prayer_screen.dart';
import 'package:quran_app/screens/qari_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  List<Widget> _widgetsList = [
    HomeScreen(),
    QuranScreen(),
    QariListScreen(),
    PrayeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _widgetsList[selectIndex],
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(
                  icon: Image.asset(
                    'assets/home.png',
                    color: Colors.white,
                  ),
                  title: 'Home'),
              TabItem(
                  icon: Image.asset(
                    'assets/holyQuran.png',
                    color: Colors.white,
                  ),
                  title: 'Quran'),
              TabItem(
                  icon: Image.asset(
                    'assets/audio.png',
                    color: Colors.white,
                  ),
                  title: 'Audio'),
              TabItem(
                  icon: Image.asset(
                    'assets/mosque.png',
                    color: Colors.white,
                  ),
                  title: 'Prayer'),
            ],
            initialActiveIndex: 0, //optional, default as 0
            onTap: updateIndex,
            backgroundColor: Constants.kPrimary,
            activeColor: Constants.kPrimary,
          )),
    );
  }

  void updateIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
