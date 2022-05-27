import 'package:flutter/material.dart';

class PrayeScreen extends StatefulWidget {
  const PrayeScreen({Key? key}) : super(key: key);

  @override
  State<PrayeScreen> createState() => _PrayeScreenState();
}

class _PrayeScreenState extends State<PrayeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Praye Screen'),
        ),
      ),
    );
  }
}
