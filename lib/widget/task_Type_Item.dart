import 'package:flutter/material.dart';

import '../data/task_type.dart';

class taskTypeItem extends StatelessWidget {
  taskTypeItem(
      {Key? key,
      required this.taskType,
      required this.index,
      required this.selectedItemList})
      : super(key: key);
  TaskType taskType;
  int index;
  int selectedItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: (selectedItemList == index)
                  ? Colors.greenAccent
                  : Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      margin: EdgeInsets.all(8),
      width: 150,
      child: Column(
        children: [
          Image(
            image: AssetImage(taskType.image),
          ),
          Text(
            taskType.title,
            style: TextStyle(fontFamily: 'shabnam'),
          )
        ],
      ),
    );
  }
}
