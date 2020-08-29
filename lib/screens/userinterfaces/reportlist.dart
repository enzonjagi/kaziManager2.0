import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager2/screens/reusables/drawer.dart';
import 'package:kazimanager2/screens/task.dart';

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  var taskData = Task.mockData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'myReports',
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        /*leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.grey[100],
          onPressed: () {
            //launch a menu
          },
        ),*/
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //open settings
            },
            color: Colors.white12,
          ),
        ],
      ),
      //
      drawer: CustomDrawer(),
      body: ListView.builder(
            itemCount: taskData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: ListTile(
                      onTap: () {
                        //openTask(index);
                      },
                      onLongPress: () {
                        //do something cool
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                      ),
                      title: Text(taskData[index].name),
                      subtitle: Text("assigned: " + taskData[index].assignee),
                      isThreeLine: true,
                      trailing: Column(children: <Widget>[
                        Icon(Icons.date_range),
                        Text("Due: " + taskData[index].duedate),
                      ]),
                    ),
                  ),
                ),
              );
            })

      
    );
  }
}