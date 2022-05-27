import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:quran_app/models/sajda.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/screens/jus_screen.dart';
import 'package:quran_app/screens/splash_screen.dart';
import 'package:quran_app/screens/surah_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Quran',
      theme: ThemeData(
          primarySwatch: Constants.kSwatchColor,
          primaryColor: Constants.kSwatchColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
    );
  }
}
