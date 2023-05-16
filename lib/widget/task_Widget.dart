import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_2/screens/edit_task_widget.dart';

import '../data/task.dart';

class taskWidget extends StatefulWidget {
  taskWidget({Key? key, required this.tasks}) : super(key: key);
  task tasks;

  @override
  State<taskWidget> createState() => _taskWidgetState();
}

class _taskWidgetState extends State<taskWidget> {
  bool isDoneChecked = false;
  @override
  void initState() {
    // TODO: implement initState

    isDoneChecked = widget.tasks.isdone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDoneChecked = !isDoneChecked;
          widget.tasks.isdone = isDoneChecked;
          widget.tasks.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
            color: Color(0xffffffff), borderRadius: BorderRadius.circular(10)),
        height: 140,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                          value: isDoneChecked, onChanged: (ischecked) {})),
                  SizedBox(
                    width: 95,
                  ),
                  Text(
                    widget.tasks.title,
                    style: TextStyle(fontFamily: 'shabnam', fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 95,
                  child: Text(
                    widget.tasks.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: 'shabnam'),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(75, 25),
                      elevation: 0,
                      primary: Colors.greenAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                            '${widget.tasks.time.hour}:${widget.tasks.time.minute}',
                            style: TextStyle(fontFamily: 'shabnam')),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.timelapse)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(75, 25),
                        elevation: 0,
                        primary: Colors.grey[100],
                        onPrimary: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return editTaskScreen(
                            tasks: widget.tasks,
                          );
                        }));
                      },
                      child: Row(
                        children: [
                          Text(
                            'ویرایش',
                            style: TextStyle(fontFamily: 'shabnam'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.edit)
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
        Image(
          image: AssetImage(widget.tasks.taskType.image),
        ),
      ],
    );
  }
}
