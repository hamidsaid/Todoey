import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Solve web Tutorials"),
    Task(name: "Finish WaTu forum"),
    Task(name: "Study Algos and Complexity"),
  ];

  int get getTaskCount {
    return tasks.length;
  }
}
