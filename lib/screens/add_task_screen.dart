import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_2/screens/Home_screen.dart';
import 'package:note_2/widget/task_Type_Item.dart';
import 'package:note_2/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../data/task.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({Key? key}) : super(key: key);

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController textControlerTitle = TextEditingController();
  final TextEditingController textControlerSubTitle = TextEditingController();
  final box = Hive.box<task>('taskbox');
  DateTime? _time;
  int _selectedTaskTypIItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: textControlerTitle,
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'عنوان',
                      labelStyle: TextStyle(
                        fontFamily: 'shabnam',
                        fontSize: 30,
                        color: negahban1.hasFocus
                            ? Color(0xff18daa3)
                            : Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18daa3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: textControlerSubTitle,
                    maxLines: 2,
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'توضیحات',
                      labelStyle: TextStyle(
                        fontFamily: 'shabnam',
                        fontSize: 30,
                        color: negahban2.hasFocus
                            ? Color(0xff18daa3)
                            : Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18daa3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  title: 'تسک رو انتخاب کن',
                  titleStyle: TextStyle(
                      fontFamily: 'shabnam', color: Colors.greenAccent),
                  negativeButtonText: 'حذف کن',
                  negativeButtonStyle:
                      TextStyle(fontFamily: 'shabnam', color: Colors.redAccent),
                  positiveButtonText: 'انتخاب زمان',
                  positiveButtonStyle: TextStyle(
                      fontFamily: 'shabnam', color: Colors.greenAccent),
                  elevation: 2,
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                  onNegativePressed: (context) {
                    print('onNegative');
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypIItem = index;
                        });
                      },
                      child: taskTypeItem(
                        taskType: getTaskTypeList()[index],
                        index: index,
                        selectedItemList: _selectedTaskTypIItem,
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  String tasktitle = textControlerTitle.text;
                  String taskSubtitle = textControlerSubTitle.text;
                  bool isdone = false;
                  addTask(
                    tasktitle,
                    taskSubtitle,
                    isdone,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(fontFamily: 'shabnam', fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff18daa3), minimumSize: Size(200, 40)),
              )
            ],
          ),
        ),
      ),
    );
  }

  addTask(
    String taskTitle,
    String taskSubTitle,
    bool isdone,
  ) {
    var tasks = task(
        title: taskTitle,
        subtitle: taskSubTitle,
        isdone: isdone,
        time: _time!,
        taskType: getTaskTypeList()[_selectedTaskTypIItem]);
    box.add(tasks);
  }
}

