// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_a/models/ach_lists.dart';
import 'package:project_a/models/achievements_model.dart';
import 'package:project_a/screens/home/home_screen.dart';

const achBoxName = "achievement_box";
const finishedAchBoxName = "finished_achievement_box";

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AchievementAdapter());
  await Hive.openBox<Achievement>(achBoxName);
  await Hive.openBox<Achievement>(finishedAchBoxName);
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<Achievement> achBox;
  late Box<Achievement> finishedAchBox;

  @override
  void initState() {
    super.initState();
    achBox = Hive.box(achBoxName);
    finishedAchBox = Hive.box(finishedAchBoxName);
    achBox.addAll(achList);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Tiro Devanagari Sanskrit"),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(
          achBox: achBox,
          finishedAchBox: finishedAchBox,
        ));
  }
}
