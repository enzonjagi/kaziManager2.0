import 'package:flutter/material.dart';
import 'package:kazimanager2/screens/reusables/drawer.dart';
import 'package:kazimanager2/screens/task.dart';
import 'package:kazimanager2/screens/taskcard.dart';
import 'package:kazimanager2/main.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  //List of tasks
  var taskData = Task.mockData;
  

  Map data = {};

  void openTask(index) async {
    //function to open a task
    //title of the taskpage appBar should be the name
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'myTasks',
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //open the create task screen
            //using the push navigator
            dynamic result = Navigator.pushNamed(
              context,
              '/createtask',
            );
            setState(() {
              data = {
                'name': result['name'],
                'assignee': result['assignee'],
                'description': result['assignee'],
                'duedate': result['duedate'],
                'todo': result['todo'],
              };
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.brown[900],
        ),
        //bottomNavigationBar: BottomNavigationBar(items: null),
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
                        openTask(index);
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
        /*Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: tasks.map((task) => TaskCard(
          task: task,
        )).toList(),
      ),*/
        );
  }
}
