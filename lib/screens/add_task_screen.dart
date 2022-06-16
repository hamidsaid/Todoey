import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskName;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            const Text(
              "Add Task",
              style: TextStyle(
                fontSize: 24,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              //show keyboard automatically
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskName = value;
              },
            ),
            Consumer<TaskData>(
              builder: (context, taskData, child) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.lightBlueAccent),
                    elevation: MaterialStateProperty.resolveWith((states) => 6),
                    shadowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                  ),
                  onPressed: () {
                    // addTaskCallback(newTaskName);
                    //add the new task to the list vis the provider package
                    taskData.addTask(newTaskName);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
