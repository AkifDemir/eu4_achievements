// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_a/models/achievements_model.dart';

class RemainAchsTab extends StatefulWidget {
  const RemainAchsTab({
    Key? key,
    required this.achBox,
  }) : super(key: key);

  final Box<Achievement> achBox;

  @override
  State<RemainAchsTab> createState() => _RemainAchsTabState();
}

class _RemainAchsTabState extends State<RemainAchsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.achBox.length,
        itemBuilder: ((context, index) {
          Achievement? currentAch = widget.achBox.getAt(index);
          if (currentAch?.isDone == false) {
            return Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  leading: Image.asset(currentAch!.image),
                  title: Text(currentAch.name),
                  subtitle: Text(currentAch.desc),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.brown,
                    ),
                    onPressed: () {
                      setState(() {
                        currentAch.isDone = true;
                      });
                    },
                  )),
            );
          } else {
            return SizedBox();
          }
        }));
  }
}
