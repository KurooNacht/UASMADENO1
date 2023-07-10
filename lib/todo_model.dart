import 'package:flutter/cupertino.dart';
import 'package:madeuas/task_model.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = []; // Contains all the tasks

  void addTaskInList() {
    TaskModel taskModel = TaskModel("title ${taskList.length}",
        "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}
