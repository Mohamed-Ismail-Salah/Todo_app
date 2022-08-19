import 'package:get/get.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task>taskllist = <Task>[].obs;

  Future<void> getTask() async {
    final List<Map<String, dynamic>> tasks = await DbHelper.query();
    taskllist.assignAll(tasks.map((data) => Task.fromJson(data)).toList());

  }

  void deleteTasks(Task task) async {
    await DbHelper.delete(task);
    getTask();
  }

  markTaskcom(int id,int val) async {
    await DbHelper.update(id,val);
    getTask();
  }

  Future<int> addTask({Task? task})  {
    return  DbHelper.insert(task!);

  }
  void deleteAllTasks() async {
    await DbHelper.deleteAll();
    getTask();
  }

}
