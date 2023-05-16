import 'package:hive/hive.dart';
import 'package:note_2/data/task_type.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class task extends HiveObject {
  task(
      {required this.title,
      required this.subtitle,
      required this.isdone,
      required this.time,
      required this.taskType});
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  bool isdone;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  TaskType taskType;
}
