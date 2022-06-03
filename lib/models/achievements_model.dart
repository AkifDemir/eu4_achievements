import 'package:hive/hive.dart';

part 'achievements_model.g.dart';

@HiveType(typeId: 1)
class Achievement {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String desc;

  @HiveField(2)
  bool isDone = false;

  @HiveField(3)
  String image;

  Achievement(this.name, this.desc, this.image);
}
