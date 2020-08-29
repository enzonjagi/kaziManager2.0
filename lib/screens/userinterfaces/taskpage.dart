import 'package:flutter/material.dart';
import 'package:kazimanager2/screens/reusables/backbuttonappbar.dart';
import 'package:kazimanager2/screens/reusables/drawer.dart';
import 'package:kazimanager2/screens/task.dart';

class OpenTask extends StatefulWidget {
  @override
  _OpenTaskState createState() => _OpenTaskState();
}

class _OpenTaskState extends State<OpenTask> {

  var taskData = Task.mockData;
  String _taskname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///TODO CREATE USING THE FOLLOWING GUIDELINE
        ///should be a card
      appBar: AppBar(
        //should be the name of the task
        title: Text(_taskname),
        leading: AppBarBack(),
        actions: [
          //to open a the original taask form for editing
          AppBarSettings(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: null
      ),
      
        ///with textfields
        ///todo list should be texts with a checkbox next to each
        ///buttons should include
        ///edit; for the team lead account only
        ///save; to save current progress
        ///complete; to mark the task as complete
        ///should have a percentage progress bar, based on the todo list

        );
  }
}
