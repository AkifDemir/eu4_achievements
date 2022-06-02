// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_a/models/achievements_model.dart';

class AllAchsTab extends StatefulWidget {
  const AllAchsTab({
    Key? key,
    required this.achBox,
    required this.finishedAchBox,
  }) : super(key: key);

  final Box<Achievement> achBox;
  final Box<Achievement> finishedAchBox;

  @override
  State<AllAchsTab> createState() => _AllAchsTabState();
}

class _AllAchsTabState extends State<AllAchsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.achBox.length,
        itemBuilder: ((context, index) {
          Achievement? currentAch = widget.achBox.getAt(index);
          return Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(currentAch!.name),
              subtitle: Text(currentAch.desc),
              trailing: currentAch.isDone == false
                  ? IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.brown,
                      ),
                      onPressed: () {
                        setState(() {
                          currentAch.isDone = true;
                          widget.finishedAchBox.add(currentAch);
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
            ),
          );
        }));
  }
}
