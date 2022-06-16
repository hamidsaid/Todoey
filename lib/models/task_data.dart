import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: "Solve web Tutorials"),
    Task(name: "Finish WaTu forum"),
    Task(name: "Study Algos and Complexity"),
  ];

  //its not a list view rather its view of the a list
  //unmodifiable because we just want to get/view the contents of the list
  //not changing or adding another task which can be done when using the normal getter
  //I.E List<Task> get getTasks{} ..make getTasks.add() possible which we do not want
  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  int get getTaskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
