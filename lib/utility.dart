import 'package:flutter/cupertino.dart';

import 'data/task_type.dart';
import 'data/type_enum.dart';


List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: TaskTypeEnum.focus),
    TaskType(
        image: 'images/social_frends.png',
        title: 'قرار دوستانه',
        taskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار',
        taskTypeEnum: TaskTypeEnum.working),
  ];
  return list;
}
