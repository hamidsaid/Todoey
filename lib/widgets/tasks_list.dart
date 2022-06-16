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
          return TaskTile(
              taskName: taskData.getTasks[index].name,
              isChecked: taskData.getTasks[index].isDone,
              checkBoxCallback: (newCheckBoxState) {
                // setState(() {
                //   widget.tasks[index].toggleDone();
                // });
              });
        },
        itemCount: taskData.getTaskCount,
      );
    });
  }
}
