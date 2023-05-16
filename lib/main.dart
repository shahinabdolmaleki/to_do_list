import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_2/screens/Home_screen.dart';
import 'package:note_2/screens/add_task_screen.dart';

import 'data/task.dart';
import 'data/task_type.dart';
import 'data/type_enum.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(taskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<task>('taskbox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SM',
          textTheme: TextTheme(
            headline4: TextStyle(
              fontFamily: 'shabnam',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        home: Homescreen());
  }
}
