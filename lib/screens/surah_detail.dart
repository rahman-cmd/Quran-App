import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import '../models/translation.dart';
import '../services/api_services.dart';
import '../widgets/custom_translation.dart';

enum Translation { english, hindi, spanish, bangla }

class Surahdetail extends StatefulWidget {
  const Surahdetail({Key? key}) : super(key: key);

  static const String id = 'surahDetail_screen';

  @override
  _SurahdetailState createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  final ApiServices _apiServices = ApiServices();
  //SolidController _controller = SolidController();
  Translation _translation = Translation.bangla;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initLanguage();
    });
    super.initState();
  }

  void initLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _translation = EnumToString.fromString(
        Translation.values, prefs.getString("language").toString())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _apiServices.getTranslation(
              Constants.surahIndex!, _translation.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                      index: index,
                      surahTranslation: snapshot.data!.translationList[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Translation Not found'),
              );
            }
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: const Center(
              child: Text(
                "Swipe me!",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('English'),
                    leading: Radio<Translation>(
                      value: Translation.english,
                      groupValue: _translation,
                      onChanged: (Translation? value) async {
                        setState(() {
                          _translation = value!;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            // ignore: deprecated_member_use
                            "language",
                            EnumToString.parse(_translation));
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Hindi'),
                    leading: Radio<Translation>(
                      value: Translation.hindi,
                      groupValue: _translation,
                      onChanged: (Translation? value) async {
                        setState(() {
                          _translation = value!;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            // ignore: deprecated_member_use
                            "language",
                            EnumToString.parse(_translation));
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Spanish'),
                    leading: Radio<Translation>(
                      value: Translation.spanish,
                      groupValue: _translation,
                      onChanged: (Translation? value) async {
                        setState(() {
                          _translation = value!;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            // ignore: deprecated_member_use
                            "language",
                            EnumToString.parse(_translation));
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Bangla'),
                    leading: Radio<Translation>(
                      value: Translation.bangla,
                      groupValue: _translation,
                      onChanged: (Translation? value) async {
                        setState(() {
                          _translation = value!;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            // ignore: deprecated_member_use
                            "language",
                            EnumToString.parse(_translation));
                      },
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
