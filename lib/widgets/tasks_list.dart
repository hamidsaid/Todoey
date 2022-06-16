import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  // List tasks;
  // TasksList({required this.tasks});

  //INSTEAD OF writting Provider.of<T>(context). ...
  //YOU CAN USE CONSUMER WIDGETS
  //WRAP ALL WIDGETS THAT REQUIRE TO CHANGE STATE IN THIS CONSUMER WIDGET
  //E.g below its TaskTile and item Count
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        //taskData can be anyName BUT
        //it equals to Provider.of<TaskData>(context)
        builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.getTasks[index];
          return TaskTile(
              taskName: task.name,
              isChecked: task.isDone,
              //called when a task is checked ✔✔
              checkBoxCallback: (newCheckBoxState) {
                //calls updateTask() which also will notify the listeners
                taskData.updateTask(task);
              });
        },
        itemCount: taskData.getTaskCount,
      );
    });
  }
}
