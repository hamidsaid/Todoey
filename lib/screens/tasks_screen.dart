import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen((newTaskName) {
              // setState(
              //   () {
              //     tasks.add(Task(name: newTaskName));
              //   },
              // );
              //remove the button modal sheet after pressing "Add"
              Navigator.pop(context);
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 30, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Todoey",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  //"${Provider.of<TaskData>(context).tasks.length} Tasks",
                  //OR
                  "${Provider.of<TaskData>(context).getTaskCount} Tasks",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TasksList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
