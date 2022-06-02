// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_a/models/achievements_model.dart';

class FinishedAchsTab extends StatefulWidget {
  const FinishedAchsTab({
    Key? key,
    required this.finishedAchBox,
  }) : super(key: key);

  final Box<Achievement> finishedAchBox;

  @override
  State<FinishedAchsTab> createState() => _FinishedAchsTabState();
}

class _FinishedAchsTabState extends State<FinishedAchsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.finishedAchBox.length,
        itemBuilder: ((context, index) {
          Achievement? currentAch = widget.finishedAchBox.getAt(index);
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
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      currentAch.isDone = false;
                      widget.finishedAchBox.deleteAt(index);
                    });
                  },
                )),
          );
        }));
  }
}
