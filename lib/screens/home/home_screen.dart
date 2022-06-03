// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_a/models/achievements_model.dart';
import 'package:project_a/screens/home/components/all_achs_tab.dart';
import 'package:project_a/screens/home/components/finished_achs_tab.dart';
import 'package:project_a/screens/home/components/remain_achs_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.achBox,
  }) : super(key: key);

  final Box<Achievement> achBox;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 5,
            elevation: 0,
            backgroundColor: Colors.redAccent,
            bottom: TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "Completed"),
                Tab(text: "Remains")
              ],
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
          ),
          body: achBox.isEmpty
              ? Center(child: Text("Database connection has been lost!"))
              : TabBarView(children: [
                  AllAchsTab(achBox: achBox),
                  FinishedAchsTab(achBox: achBox),
                  RemainAchsTab(achBox: achBox),
                ])),
    );
  }
}
