import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/custom%20text.dart';
import '../screens/Notification screen.dart';

class Task_Tile extends StatefulWidget {
  DateTime selectedDate = DateTime.now();
  Task_Tile({required this.selectedDate});

  @override
  State<Task_Tile> createState() => _Task_TileState();
}

class _Task_TileState extends State<Task_Tile> {
  late final Task task;

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemBuilder: (BuildContext contex, int index) {
            var task = taskController.taskllist[index];

            if (task.repeat == "  once every day" ||
                task.data == DateFormat.yMd().format(widget.selectedDate) ||
                (task.repeat == 'Once every week' &&
                    widget.selectedDate
                                .difference(DateFormat.yMd().parse(task.data!))
                                .inDays %
                            7 ==
                        0) ||
                (task.repeat == 'Once every month' &&
                    DateFormat.yMd().parse(task.data!).day ==
                        widget.selectedDate.day)) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => Notification_screen(
                          task: task,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(task.color!).withOpacity(.5),
                      borderRadius: BorderRadius.circular(
                          20), //color:Color(0xFF+task.color!)
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Custom_text(
                              text: "Title:-    ${task.title!}",
                              titel: false,
                            ),
                            Divider(color: Colors.black),
                            Custom_text(
                              text: "Start Time:-  ${task.startTime}  ",
                              titel: false,
                              size: 25,
                            ),
                            Custom_text(
                              text: "End Time:-   ${task.endTime}",
                              titel: false,
                              size: 25,
                            ),
                            Custom_text(
                              text: "Note:-    ${task.note!}",
                              titel: false,
                              size: 25,
                            ),
                            Custom_text(
                              text: "Repeat:-${task.repeat!}",
                              titel: false,
                              size: 25,
                            ),
                            Row(
                              children: [
                                Custom_text(
                                  text: "Done:-  ",
                                  titel: false,
                                  size: 25,
                                ),
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: task.isCompleted == 0 ? false : true,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (task.isCompleted == 0) {
                                        task.isCompleted = 1;
                                        taskController.markTaskcom(task.id!, 1);
                                      } else {
                                        task.isCompleted = 0;
                                        taskController.markTaskcom(task.id!, 0);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Custom_text(
                                  text: "Delete:- ",
                                  titel: false,
                                  size: 25,
                                ),
                                IconButton(
                                    onPressed: () {
                                      taskController.deleteTasks(task);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
          itemCount: taskController.taskllist.length,
        ),
      ),
    );
  }
}
