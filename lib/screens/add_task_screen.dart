import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  const AddTaskScreen(this.addTaskCallback);

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
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.lightBlueAccent),
                elevation: MaterialStateProperty.resolveWith((states) => 6),
                shadowColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
              ),
              onPressed: () {
                addTaskCallback(newTaskName);
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
