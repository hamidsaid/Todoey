import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //return an object of Data class
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
