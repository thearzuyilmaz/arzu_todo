import 'package:arzu_todo/models/task.dart';
import 'package:flutter/cupertino.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Water'),
  ];

  // method
  void addNewTask(Task item) {
    tasks.add(item);
    notifyListeners();
  }

  // getter
  int get taskCount {
    return tasks.length;
  }

  void updateCheckness(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
