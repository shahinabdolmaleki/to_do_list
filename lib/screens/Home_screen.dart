import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_2/screens/add_task_screen.dart';
import 'package:note_2/widget/task_Widget.dart';
import 'package:note_2/widget/task_Widget.dart';

import '../data/task.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var taskbox = Hive.box<task>('taskbox');
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: taskbox.listenable(),
            builder: (context, value, child) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notif) {
                  setState(() {
                    if (notif.direction == ScrollDirection.forward) {
                      isvisible = true;
                    }
                    if (notif.direction == ScrollDirection.reverse) {
                      isvisible = false;
                    }
                  });
                  return true;
                },
                child: ListView.builder(
                  itemCount: taskbox.values.length,
                  itemBuilder: (context, index) {
                    var task = taskbox.values.toList()[index];
                    return getListItem(task);
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isvisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return addTaskScreen();
            }));
          },
          backgroundColor: Colors.greenAccent,
          child: Image(
            image: AssetImage('images/icon_add.png'),
          ),
        ),
      ),
    );
  }

  Dismissible getListItem(task task) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          task.delete();
        },
        child: taskWidget(tasks: task));
  }
}
