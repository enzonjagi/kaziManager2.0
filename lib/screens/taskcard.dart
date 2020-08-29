import 'package:flutter/material.dart';
import 'package:kazimanager2/screens/task.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  //final Function delete;
  TaskCard({this.task});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget> [
            Text(
              task.name,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              task.assignee,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              task.duedate,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ]
        ),
      )
    );
  }
}
